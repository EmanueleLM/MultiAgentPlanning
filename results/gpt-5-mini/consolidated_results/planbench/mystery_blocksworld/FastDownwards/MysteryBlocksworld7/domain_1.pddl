(define (domain cravings)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  ;; Predicates
  (:predicates
    (planet ?o - object)
    (province ?o - object)
    (harmony)
    (pain ?o - object)
    (craves ?x - object ?y - object)

    ;; Discrete stage progression to enforce ordered, contiguous occupancy.
    (step ?s - step)
    (step-next ?s1 - step ?s2 - step)
    (step-current ?s - step)
    (step-done ?s - step)
  )

  ;; Attack: requires province and planet on the same object and global harmony.
  ;; Produces pain on the object and removes province, planet and harmony.
  ;; Consumes one step (advances current step).
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

  ;; Succumb: requires pain on an object; restores province, planet and harmony; removes pain.
  ;; Consumes one step.
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
  ;; Preconditions: subject has pain, the other object has a province.
  ;; Effects: adds harmony, gives province to subject, creates (craves ?x ?y);
  ;;          removes the other's province and removes the subject's pain.
  ;; Consumes one step.
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
  ;; Preconditions: (craves ?x ?y), subject has a province and harmony holds.
  ;; Effects: produces pain on subject, gives province to other, consumes craves, removes
  ;;          the subject's province and harmony.
  ;; Consumes one step.
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