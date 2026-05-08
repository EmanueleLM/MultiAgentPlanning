; Domain: orchestrator
; Ambiguity resolutions / modelling decisions (brief):
; - Chosen canonical unary predicate (pain ?x) to represent "x is in pain".
; - province(?x) and planet(?x) are dynamic fluents (actions can add/delete them).
; - harmony is a global propositional fluent represented as the 0-ary predicate (harmony).
; - Actions were prefixed with agent identifiers to keep agent actions distinct:
;     attacker-attack, eater-feast, succumber-succumb, overcomer-overcome
; - No implicit mappings between craves and pain; actions explicitly produce/consume these predicates.
; - The domain uses a single object type "obj".
(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?x - obj ?y - obj)
    (pain ?o - obj)
    (harmony)
  )

  ;; attacker-attack: attacker (a province) attacks a target planet while harmony holds.
  ;; Effects: attacker becomes in pain, attacker loses province status, target planet loses planet status, harmony is removed.
  (:action attacker-attack
    :parameters (?attacker - obj ?target - obj)
    :precondition (and
                    (province ?attacker)
                    (planet ?target)
                    (harmony)
                  )
    :effect (and
              (pain ?attacker)
              (not (province ?attacker))
              (not (planet ?target))
              (not (harmony))
            )
  )

  ;; eater-feast: an eater that craves a target consumes it while harmony holds.
  ;; Effects: eater goes into pain, target gains province status; eater loses province status, the craves relation and harmony are removed.
  (:action eater-feast
    :parameters (?eater - obj ?target - obj)
    :precondition (and
                    (craves ?eater ?target)
                    (province ?eater)
                    (harmony)
                  )
    :effect (and
              (pain ?eater)
              (province ?target)
              (not (craves ?eater ?target))
              (not (province ?eater))
              (not (harmony))
            )
  )

  ;; succumber-succumb: an object in pain succumbs, producing a province and planet and restoring harmony.
  ;; Effects: adds province and planet for the object, restores harmony, removes pain.
  (:action succumber-succumb
    :parameters (?x - obj)
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

  ;; overcomer-overcome: an object in pain overcomes another province-holder.
  ;; Preconditions: the sufferer must be in pain and the other must be a province holder.
  ;; Effects: restores harmony, gives province to the sufferer, makes the sufferer crave the other; removes the other's province and removes the sufferer's pain.
  (:action overcomer-overcome
    :parameters (?sufferer - obj ?other - obj)
    :precondition (and
                    (pain ?sufferer)
                    (province ?other)
                  )
    :effect (and
              (harmony)
              (province ?sufferer)
              (craves ?sufferer ?other)
              (not (province ?other))
              (not (pain ?sufferer))
            )
  )
)