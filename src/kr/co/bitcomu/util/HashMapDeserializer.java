package kr.co.bitcomu.util;

import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.google.common.base.Function;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.sun.istack.internal.Nullable;

public class HashMapDeserializer implements JsonDeserializer {

	@Override
	public HashMap deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext ctx) throws JsonParseException {
		JsonObject obj = json.getAsJsonObject();
		Entry entry = obj.entrySet().iterator().next();
		HashMap resultMap = new HashMap();
		resultMap.put(entry.getKey(), ParseObjectFromElement.SINGLETON.apply(entry.getValue()));
		return resultMap;
	}

	public enum ParseObjectFromElement implements Function {
		SINGLETON;
		public Object apply(JsonElement input) {
			Object value = null;
			if (input == null || input.isJsonNull()) {
				value = null;
			} else if (input.isJsonPrimitive()) {
				JsonPrimitive primitive = input.getAsJsonPrimitive();
				if (primitive.isNumber()) {
					value = primitive.getAsInt(); // Number 값은 무조건 integer로 처리
				} else if (primitive.isBoolean()) {
					value = primitive.getAsBoolean();
				} else {
					value = primitive.getAsString();
				}
			} else if (input.isJsonArray()) {
				value = Lists.newArrayList(Iterables.transform(input.getAsJsonArray(), this));
			} else if (input.isJsonObject()) {
				value = Maps. newLinkedHashMap(
						Maps.transformValues(JsonObjectAsMap.INSTANCE.apply(input.getAsJsonObject()), this));
			}
			return value;
		}

		@Override
		public @Nullable Object apply(@Nullable Object arg0) {
			// TODO Auto-generated method stub
			return null;
		}
	}

	public enum JsonObjectAsMap implements Function {
		INSTANCE;

		private final Field members;

		JsonObjectAsMap() {
			try {
				members = JsonObject.class.getDeclaredField("members");
				members.setAccessible(true);
			} catch (NoSuchFieldException e) {
				throw new UnsupportedOperationException("cannot access gson internals", e);
			}
		}

		@SuppressWarnings("unchecked")
		public Map apply(JsonObject in) {
			try {
				return (Map) members.get(in);
			} catch (IllegalArgumentException e) {
				throw new UnsupportedOperationException("cannot access gson internals", e);
			} catch (IllegalAccessException e) {
				throw new UnsupportedOperationException("cannot access gson internals", e);
			}
		}

		@Override
		public @Nullable Object apply(@Nullable Object arg0) {
			// TODO Auto-generated method stub
			return null;
		}
	}
}