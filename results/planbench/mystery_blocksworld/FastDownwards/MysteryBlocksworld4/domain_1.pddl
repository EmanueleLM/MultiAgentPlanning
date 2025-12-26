(define (domain MysteryBlocksworld4)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    object
  )
  
  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)
    (craves ?o1 - object ?o2 - object)
    (harmony)
  )

  ;; Action: Attack (?o). Pre: (province ?o), (planet ?o), (harmony). Add: (pain ?o). Del: (province ?o), (planet ?o), (harmony).
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

  ;; Action: Succumb (?o). Pre: (pain ?o). Add: (province ?o), (planet ?o), (harmony). Del: (pain ?o).
  (:action Succumb
    :parameters (?o - object)
    :precondition (pain ?o)
    :effect (and 
      (province ?o) 
      (planet ?o) 
      (harmony)
      (not (pain ?o))
    )
  )

  ;; Action: Overcome (?o1 ?o2). Pre: (province ?o2), (pain ?o1). Add: (harmony), (province ?o1), (craves ?o1 ?o2). Del: (province ?o2), (pain ?o1).
  (:action Overcome
    :parameters (?o1 - object ?o2 - object)
    :precondition (and 
      (province ?o2) 
      (pain ?o1)
    )
    :effect (and 
      (harmony)
      (province ?o1)
      (craves ?o1 ?o2)
      (not (province ?o2))
      (not (pain ?o1))
    )
  )

  ;; Action: Feast (?o1 ?o2). Pre: (craves ?o1 ?o2), (province ?o1), (harmony). Add: (pain ?o1), (province ?o2). Del: (craves ?o1 ?o2), (province ?o1), (harmony).
  (:action Feast
    :parameters (?o1 - object ?o2 - object)
    :precondition (and 
      (craves ?o1 ?o2) 
      (province ?o1) 
      (harmony)
    )
    :effect (and 
      (pain ?o1)
      (province ?o2)
      (not (craves ?o1 ?o2))
      (not (province ?o1))
      (not (harmony))
    )
  )
)