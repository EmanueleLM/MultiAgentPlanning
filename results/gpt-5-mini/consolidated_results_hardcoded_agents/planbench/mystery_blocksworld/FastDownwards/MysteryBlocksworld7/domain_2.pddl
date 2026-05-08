(define (domain cravings)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    ;; Object-level state
    (planet ?o - object)
    (province ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?x - object ?y - object)

    ;; Discrete stage progression (ordered, contiguous occupancy)
    (step ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (step-current ?s - step)
    (step-done ?s - step)
  )

  ;; Attack: requires that the subject object has both a province and a planet
  ;; (interpreted as predicates on the same object) and that global harmony holds.
  ;; Effects: subject gains pain; subject's province and planet and global harmony are removed.
  ;; The action advances the global step from ?s to ?snext (contiguous stage occupancy).
  (:action attack
    :parameters (?x - object ?s - step ?snext - step)
    :precondition (and
                    (province ?x)
                    (planet ?x)
                    (harmony)
                    (step-current ?s)
                    (step-next ?s ?snext)
                  )
    :effect (and
              (pain ?x)
              (not (province ?x))
              (not (planet ?x))
              (not (harmony))

              ;; advance step
              (not (step-current ?s))
              (step-current ?snext)
              (step-done ?s)
            )
  )

  ;; Succumb: subject must have pain. Effects restore province, planet, and harmony,
  ;; and remove pain. Advances the global step.
  (:action succumb
    :parameters (?x - object ?s - step ?snext - step)
    :precondition (and
                    (pain ?x)
                    (step-current ?s)
                    (step-next ?s ?snext)
                  )
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))

              ;; advance step
              (not (step-current ?s))
              (step-current ?snext)
              (step-done ?s)
            )
  )

  ;; Overcome: subject ?x overcomes toward other ?y.
  ;; Preconditions: subject has pain; other object has a province.
  ;; Effects: global harmony is established, subject receives a province,
  ;;         subject acquires (craves ?x ?y), the other's province is removed,
  ;;         and the subject's pain is removed. Advances the global step.
  (:action overcome
    :parameters (?x - object ?y - object ?s - step ?snext - step)
    :precondition (and
                    (pain ?x)
                    (province ?y)
                    (step-current ?s)
                    (step-next ?s ?snext)
                  )
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain ?x))

              ;; advance step
              (not (step-current ?s))
              (step-current ?snext)
              (step-done ?s)
            )
  )

  ;; Feast: subject ?x feasts on other ?y.
  ;; Preconditions: (craves ?x ?y), subject has a province, and harmony holds.
  ;; Effects: subject gains pain, other receives a province, the craves relation is removed,
  ;;          subject's province and global harmony are removed. Advances the global step.
  (:action feast
    :parameters (?x - object ?y - object ?s - step ?snext - step)
    :precondition (and
                    (craves ?x ?y)
                    (province ?x)
                    (harmony)
                    (step-current ?s)
                    (step-next ?s ?snext)
                  )
    :effect (and
              (pain ?x)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))

              ;; advance step
              (not (step-current ?s))
              (step-current ?snext)
              (step-done ?s)
            )
  )
)