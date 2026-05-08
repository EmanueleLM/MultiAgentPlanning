(define (domain orchestrated-domain)
  ; Requirements limited to :strips, :typing, and :negative-preconditions as requested.
  (:requirements :strips :typing :negative-preconditions)

  (:types agent)

  ; Predicates used across actions -- keep names explicit and consistent.
  (:predicates
    (alive ?p - agent)
    (exposed ?p - agent)          ; target has been exposed by an attack and may succumb
    (defeated ?p - agent)         ; target has succumbed / been defeated
    (has-feasted ?e - agent ?t - agent) ; eater has feasted on target
    (craves ?x - agent ?y - agent)      ; x now craves y (goal-relevant)
    (overcame ?a - agent ?o - agent)    ; a overcame obstacle o (keeps trace of overcome order)
  )

  ; Note: The specification required the 4 action names attack, succumb, overcome, feast.
  ; Their parameters and pre/postconditions are defined conservatively so that
  ; "succumb" can only occur after an "attack" (exposed), and "feast" can only occur
  ; on someone already defeated. This enforces order constraints explicitly.

  (:action attack
    :parameters (?attacker - agent ?target - agent)
    :precondition (and
                    (alive ?attacker)
                    (alive ?target)
                    (not (defeated ?target))
                    (not (exposed ?target))
                  )
    :effect (and
              (exposed ?target)
            )
  )

  (:action succumb
    :parameters (?target - agent ?by - agent)
    :precondition (and
                    (alive ?target)
                    (exposed ?target)   ; ensures succumbing follows an attack that exposed the target
                    (alive ?by)
                  )
    :effect (and
              (defeated ?target)
              (not (exposed ?target))
            )
  )

  ; "overcome" records that an agent overcame a (defeated) obstacle.
  ; It requires the obstacle to already be defeated so it cannot be used to defeat something.
  (:action overcome
    :parameters (?agent - agent ?obstacle - agent)
    :precondition (and
                    (alive ?agent)
                    (defeated ?obstacle)
                    (not (overcame ?agent ?obstacle))
                  )
    :effect (and
              (overcame ?agent ?obstacle)
            )
  )

  ; "feast" produces the goal-relevant (craves ...) predicate.
  ; It is only allowed on a defeated target and is irreversible here (has-feasted records it).
  (:action feast
    :parameters (?eater - agent ?prey - agent)
    :precondition (and
                    (alive ?eater)
                    (defeated ?prey)
                    (not (has-feasted ?eater ?prey))
                  )
    :effect (and
              (has-feasted ?eater ?prey)
              (craves ?eater ?prey)
            )
  )
)