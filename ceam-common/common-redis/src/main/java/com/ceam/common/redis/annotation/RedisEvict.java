package com.ceam.common.redis.annotation;

import java.lang.annotation.*;

/**
 * <p>File：RedisEvict.java</p>
 * <p>Title: redis删除注解</p>
 * <p>Description:</p>
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RedisEvict
{
    String key();

    String fieldKey();
}
