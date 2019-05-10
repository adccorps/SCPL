package utils;

/**
 * 接口{@link Function}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public interface Function<T, K> {
    public Object apply(T t, K k);
}
