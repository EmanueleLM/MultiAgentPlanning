(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?x - obj)        ; object ?x currently holds a province token
    (planet ?x - obj)          ; object ?x currently is a planet (mutable in this domain)
    (pain ?x - obj)            ; object ?x currently in pain
    (craves ?x - obj ?y - obj) ; object ?x craves object ?y
    (harmony)                  ; global harmony flag
  )

  ;; Attack: requires the same object to have province and planet, and global harmony.
  ;; Effects: gives that object pain, and removes its province, planet and global harmony.
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
             )
  )

  ;; Succumb: requires that a specific object is in pain.
  ;; Effects: that object regains province and planet and restores global harmony,
  ;; and the object's pain is removed.
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
             )
  )

  ;; Overcome: subject ?o must be in pain and ?other must currently hold a province.
  ;; Effects: restores global harmony, grants province to the subject, creates (craves ?o ?other),
  ;; and removes the other's province and the subject's pain.
  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
                    (pain ?o)
                    (province ?other)
                   )
    :effect (and
              (harmony)
              (province ?o)
              (craves ?o ?other)
              (not (province ?other))
              (not (pain ?o))
             )
  )

  ;; Feast: subject ?o feasts on ?other. Requires that ?o craves ?other, ?o has a province, and harmony.
  ;; Effects: produces pain on the feaster, transfers the province to the target, consumes the craves link,
  ;; and consumes harmony.
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
             )
  )
)