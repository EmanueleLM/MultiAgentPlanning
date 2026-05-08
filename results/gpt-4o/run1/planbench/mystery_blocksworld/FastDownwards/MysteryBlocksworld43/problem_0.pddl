(define (problem specific_instance)
  (:domain state_transitions)
  (:objects
    a b c d - object)
  (:init
    (planet a)
    (planet b)
    (planet d)
    (province b)
    (province c)
    (province d)
    (harmony)
    (object_craves c a))
  (:goal
    (and
      (object_craves b c)
      (object_craves d b)))
)