(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
  )
  (:init
    (feline object_0) (feline object_1) (feline object_2)
    (collects object_10 object_4) (collects object_11 object_5) (collects object_9 object_3)
    (holder object_12)
    (connected object_0 object_9) (connected object_1 object_10) (connected object_12 object_11)
    (connected object_2 object_11) (connected object_6 object_9) (connected object_7 object_10)
    (connected object_8 object_11)
    (sneezy object_6) (sneezy object_7) (sneezy object_8)
    (springlike object_10) (springlike object_11) (springlike object_9)
    (stupendous object_3) (stupendous object_4) (stupendous object_5)
    (surface object_10) (surface object_11) (surface object_9)
  )
  (:goal
    (connected object_12 object_10)
  )
)