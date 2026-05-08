(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person)

  (:predicates
    (craves ?p - person ?q - person)        ; ?p craves ?q
    (acquainted ?p - person ?q - person)   ; ?p is acquainted with ?q (can influence)
  )

  ;; Agent A's distinct action: A persuades a target to crave A
  (:action persuade-by-a
    :parameters (?target - person)
    :precondition (and
      (acquainted a ?target)
      (not (craves ?target a))
    )
    :effect (and
      (craves ?target a)
    )
  )

  ;; Agent B's distinct action: B persuades a target to crave B
  (:action persuade-by-b
    :parameters (?target - person)
    :precondition (and
      (acquainted b ?target)
      (not (craves ?target b))
    )
    :effect (and
      (craves ?target b)
    )
  )

  ;; Agent C's distinct action: C persuades a target to crave C
  (:action persuade-by-c
    :parameters (?target - person)
    :precondition (and
      (acquainted c ?target)
      (not (craves ?target c))
    )
    :effect (and
      (craves ?target c)
    )
  )

  ;; Agent D's distinct action: D persuades a target to crave D
  (:action persuade-by-d
    :parameters (?target - person)
    :precondition (and
      (acquainted d ?target)
      (not (craves ?target d))
    )
    :effect (and
      (craves ?target d)
    )
  )
)