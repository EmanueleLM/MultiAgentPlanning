(define (problem tripplanningexample46_problem)
  (:domain tripplanningexample46)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at stockholm)
    (current day_1)
    (in_city_on day_1 stockholm)
    (visited stockholm)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)
  )

  (:goal
    (and
      (current day_11)

      (visited seville)
      (visited manchester)
      (visited stockholm)

      (in_city_on day_1 stockholm)
      (in_city_on day_3 stockholm)

      (in_city_on day_2 stockholm)
      (in_city_on day_4 seville)
      (in_city_on day_5 seville)
      (in_city_on day_6 seville)
      (in_city_on day_7 seville)
      (in_city_on day_8 manchester)
      (in_city_on day_9 manchester)
      (in_city_on day_10 manchester)
      (in_city_on day_11 manchester)
    )
  )
)