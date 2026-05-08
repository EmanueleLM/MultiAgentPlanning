; Domain: orchestrator
; Ambiguity resolutions / modelling decisions (brief):
; - Kept agent-prefixed action names using underscores: attacker_attack, feaster_feast, succumber_succumb, overcomer_overcome.
; - Unary predicates: province, planet, pain. Binary predicate: craves.
; - Global boolean fluent represented as a 0-ary predicate: (harmony).
; - Single object type: obj.
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

  ;; attacker_attack: attacker (a province) attacks a target planet while harmony holds.
  ;; Effects: attacker becomes in pain; attacker loses province; target loses planet; harmony is removed.
  (:action attacker_attack
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

  ;; feaster_feast: an object that craves another and is a province consumes the craved object while harmony holds.
  ;; Effects: feaster goes into pain; target gains province; the craves relation, feaster's province, and harmony are removed.
  (:action feaster_feast
    :parameters (?feaster - obj ?target - obj)
    :precondition (and
                    (craves ?feaster ?target)
                    (province ?feaster)
                    (harmony)
                  )
    :effect (and
              (pain ?feaster)
              (province ?target)
              (not (craves ?feaster ?target))
              (not (province ?feaster))
              (not (harmony))
            )
  )

  ;; succumber_succumb: an object in pain succumbs, restoring province, planet, and harmony; pain is removed.
  (:action succumber_succumb
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

  ;; overcomer_overcome: an object in pain overcomes another province-holder.
  ;; Effects: restores harmony, gives province to the sufferer, makes the sufferer crave the other;
  ;; removes the other's province and removes the sufferer's pain.
  (:action overcomer_overcome
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