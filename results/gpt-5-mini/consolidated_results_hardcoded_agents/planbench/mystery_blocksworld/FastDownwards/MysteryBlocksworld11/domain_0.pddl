; Domain: orchestration-domain
; Ambiguity resolutions (brief):
; - pain(...) is a unary predicate applied to the acting object (feaster/attacker/overcomer) as described in the schemas.
; - harmony is represented as a 0-ary proposition (predicate with no arguments) and is added/deleted globally by actions that state so.
; - Actions that have semantically different parameter roles (actor vs target) enforce distinctness via (not (= ?x ?y)).
; - Action names are prefixed with an agent-style label to keep agent actions distinct: attacker-*, feaster-*, succumber-*, overcomer-*.
(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)

  (:predicates
    (province ?x - entity)
    (planet   ?x - entity)
    (pain     ?x - entity)
    (craves   ?x - entity ?y - entity)
    (harmony)
  )

  ;; attacker-attack: actor (?p) must be a province and target (?t) must be a planet,
  ;; global harmony required. Actor becomes in pain; actor's province and target's planet removed; harmony removed.
  (:action attacker-attack
    :parameters (?p - entity ?t - entity)
    :precondition (and
                    (province ?p)
                    (planet ?t)
                    (harmony)
                    (not (= ?p ?t))
                  )
    :effect (and
              (pain ?p)
              (not (province ?p))
              (not (planet ?t))
              (not (harmony))
            )
  )

  ;; feaster-feast: feaster ?x must crave ?y, be a province, and harmony must hold.
  ;; Feaster becomes in pain; feaster loses province; target ?y becomes province; craves removed; harmony removed.
  (:action feaster-feast
    :parameters (?x - entity ?y - entity)
    :precondition (and
                    (craves ?x ?y)
                    (province ?x)
                    (harmony)
                    (not (= ?x ?y))
                  )
    :effect (and
              (pain ?x)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))
            )
  )

  ;; succumber-succumb: restores province and planet for ?x and asserts harmony; removes pain(?x).
  (:action succumber-succumb
    :parameters (?x - entity)
    :precondition (and
                    (pain ?x)
                  )
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
            )
  )

  ;; overcomer-overcome: actor ?u (in pain) displaces province from ?v (requires province ?v).
  ;; Adds harmony, gives province to ?u and makes ?u crave ?v; removes province ?v and pain ?u.
  (:action overcomer-overcome
    :parameters (?u - entity ?v - entity)
    :precondition (and
                    (pain ?u)
                    (province ?v)
                    (not (= ?u ?v))
                  )
    :effect (and
              (harmony)
              (province ?u)
              (craves ?u ?v)
              (not (province ?v))
              (not (pain ?u))
            )
  )

)