; Domain: orchestration
; Comment: Resolutions and conventions chosen for encoding:
; - Unary predicates chosen: (province ?x), (planet ?x), (pain ?x). Binary predicate (craves ?x ?y). Global proposition (harmony).
; - The Attack action attributes pain to the province parameter (pain(?prov)).
; - The original ambiguous "Province other/object" in Overcome was interpreted so that province status is transferred:
;   Overcome(?x,?y) requires province(?y) and pain(?x), and results in province(?x) and craves(?x ?y) while removing province(?y) and pain(?x).
; - Action names are prefixed with agent identifiers to keep agent actions distinct:
;   attacker-attack, feaster-feast, succumber-succumb, overcomer-overcome.
; - No implicit cascading deletions are performed: facts mentioning an object remain unless explicitly deleted by an action.
; - No additional resources, types, or objects beyond those in the specification were introduced.
(define (domain orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)

  (:predicates
    (province ?e - entity)
    (planet   ?e - entity)
    (pain     ?e - entity)
    (craves   ?a - entity ?b - entity)
    (harmony)
  )

  ; attacker-attack: consumes harmony, removes province and planet type facts, and adds pain to the province parameter
  (:action attacker-attack
    :parameters (?prov - entity ?pl - entity)
    :precondition (and (province ?prov) (planet ?pl) (harmony))
    :effect (and
      (pain ?prov)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ; feaster-feast: actor X who craves Y loses province status and gains pain; Y becomes a province; harmony is consumed.
  (:action feaster-feast
    :parameters (?x - entity ?y - entity)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  ; succumber-succumb: removes pain from X, grants province and planet to X, and restores harmony.
  (:action succumber-succumb
    :parameters (?x - entity)
    :precondition (pain ?x)
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ; overcomer-overcome: transfers province status from Y to X, removes pain from X, creates craves(X,Y), and restores harmony.
  (:action overcomer-overcome
    :parameters (?x - entity ?y - entity)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

)