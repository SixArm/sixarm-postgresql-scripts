/**
 * sample: given an array, randomly return an element.
 * 
 * Syntax:
 *
 *     sample(array) => element
 *
 * Example:
 *
 *     # select sample(array['alpha', 'bravo', 'charlie']);
 *     sample 
 *     --------
 *     baz
 *
 * This is for arrays of any type.
 *
 * This is for one-dimensional arrays.
 *
 * The array index may start and end anywhere, may 
 * have gaps, and doesn't need to formatted as usual.
 * 
 * We ignore NULL data; NULL is returned only if the
 * array is empty or if NULL is inserted (values of 
 * other non-array types produce an error).
 * 
 * Implementation notes:
 * 
 * Without the first IF statement, an empty array would
 * lead to an endless loop.
 * 
 * Without the loop, gaps and NULLs would make the 
 * function return NULL.
 * 
 * If you know that your arrays start at zero,
 * then you can omit both array_lower calls.
 * 
 * With gaps in the index, you will need array_upper 
 * instead of array_length; without gaps, it's the 
 * same (not sure which is faster, but they should
 * be similar).
 *
 * The +1 after second array_lower serves to get the last 
 * value in the array with the same probability as any 
 * other; otherwise it would need the random()'s output
 * to be exactly 1, which never happens.
 * 
 * This function is optimized for flexibility, not speed.
 * If you prefer speed, then you can use a simpler function.
 *
 * Credit: https://stackoverflow.com/users/1801588/pavel-v
 */

CREATE OR REPLACE FUNCTION sample( a anyarray, OUT x anyelement )
  RETURNS anyelement AS
$func$
BEGIN
  IF a = '{}' THEN
    x := NULL::TEXT;
  ELSE
    WHILE x IS NULL LOOP
      x := a[floor(array_lower(a, 1) + (random()*( array_upper(a, 1) -  array_lower(a, 1)+1) ) )::int];
    END LOOP;
  END IF;
END
$func$ LANGUAGE plpgsql VOLATILE RETURNS NULL ON NULL INPUT;
