(define (domain MysteryBlocksworld25)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (craves ?x - object ?y - object)
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (harmony)
  )

  ;; Attack: requires the object to hold both province and planet and global harmony.
  ;; Effects: produces pain on the object, removes its province and planet, removes harmony.
  (:action Attack
    :parameters (?o - object)
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

  ;; Succumb: requires pain on the object.
  ;; Effects: restores the object's province and planet, restores global harmony, removes pain.
  (:action Succumb
    :parameters (?o - object)
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

  ;; Overcome: requires that some other object holds a province and that this object is in pain.
  ;; Effects: produces global harmony, grants province to the acting object, creates craves from acting object toward the other object,
  ;; removes the other's province and the acting object's pain.
  (:action Overcome
    :parameters (?o - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  ;; Feast: requires a craves relation from eater to victim, the eater's province, and global harmony.
  ;; Effects: produces pain on the eater, grants province to the victim, removes the craves relation,
  ;; removes the eater's province and global harmony.
  (:action Feast
    :parameters (?o - object ?other - object)
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