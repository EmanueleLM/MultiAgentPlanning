(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)        ; object ?x currently holds a province token
    (planet ?x - obj)          ; object ?x currently is a planet
    (pain ?x - obj)            ; object ?x currently in pain
    (craves ?x - obj ?y - obj) ; object ?x craves object ?y
    (harmony)                  ; global harmony flag (true/false)
    (no-pain)                  ; global flag: no object is in pain (true iff no pain facts)
    (has-crave ?x - obj)       ; auxiliary: subject ?x currently has any craves relation
  )

  ;; Attack: single-argument action. Actor must be both province and planet and harmony present.
  ;; Produces pain on the same object, removes its province/planet and consumes harmony.
  (:action attack
    :parameters (?o - obj)
    :precondition (and
                    (province ?o)
                    (planet ?o)
                    (harmony)
                   )
    :effect (and
              (pain ?o)
              (not (province ?o))
              (not (planet ?o))
              (not (harmony))
              ; after creating pain we must indicate "no-pain" is false
              (not (no-pain))
             )
  )

  ;; Succumb: consumes a specific object's pain, restores its province and planet and harmony,
  ;; and signals that there is no pain in the world (no-pain).
  (:action succumb
    :parameters (?o - obj)
    :precondition (and
                    (pain ?o)
                   )
    :effect (and
              (province ?o)
              (planet ?o)
              (harmony)
              (not (pain ?o))
              (no-pain)
             )
  )

  ;; Feast: actor ?o feasts on ?other. Requires that ?o currently craves ?other,
  ;; that ?o holds a province, and that global harmony holds. Feast consumes the craves link
  ;; and the province of the feaster, produces pain on the feaster and transfers the province
  ;; to the target, and consumes harmony. Also clears the has-crave marker for the feaster.
  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
                    (craves ?o ?other)
                    (province ?o)
                    (harmony)
                   )
    :effect (and
              (pain ?o)
              (province ?other)
              (not (craves ?o ?other))
              (not (province ?o))
              (not (harmony))
              (not (has-crave ?o))
              (not (no-pain))
             )
  )

  ;; Overcome: actor ?o overcomes ?other. Requires that ?o is in pain and that ?other holds a province.
  ;; Also requires that ?o has no existing craves (enforces at-most-one-crave per subject).
  ;; Effects: moves the province from ?other to ?o, clears ?o's pain, restores global harmony,
  ;; and establishes that ?o craves ?other (and sets has-crave).
  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
                    (pain ?o)
                    (province ?other)
                    (not (has-crave ?o))   ; enforce subject has no other craves before creating new one
                   )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (has-crave ?o)
              (not (province ?other))
              (not (pain ?o))
              (no-pain)
             )
  )
)