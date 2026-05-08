(define (domain MysteryBlocksworld25)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (harmony)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Attack: requires the object to hold both province and planet and global harmony.
  ;; Effects: produces pain on the object, removes its province and planet, removes harmony,
  ;; and advances the plan step.
  (:action Attack
    :parameters (?o - object ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (province ?o)
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Succumb: requires pain on the object.
  ;; Effects: restores the object's province and planet, restores global harmony,
  ;; removes pain, and advances the plan step.
  (:action Succumb
    :parameters (?o - object ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Overcome: requires that some other object holds a province and that this object is in pain.
  ;; Effects: produces global harmony, grants province to the acting object, creates craves relation
  ;; from acting object toward the other object, removes the other's province and the acting object's pain,
  ;; and advances the plan step.
  (:action Overcome
    :parameters (?o - object ?other - object ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Feast: requires a craves relation from the eater to the victim, the eater's province, and global harmony.
  ;; Effects: produces pain on the eater, grants province to the victim, removes the craves relation,
  ;; removes the eater's province and global harmony, and advances the plan step.
  (:action Feast
    :parameters (?o - object ?other - object ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
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
      (not (current ?s))
      (current ?s2)
    )
  )

)