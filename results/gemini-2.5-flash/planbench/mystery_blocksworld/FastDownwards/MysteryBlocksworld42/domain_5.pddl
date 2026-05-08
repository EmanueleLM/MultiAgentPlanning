(define (domain mystery_blocksworld42)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    thing
  )
  (:predicates
    (province ?o - thing)
    (planet ?o - thing)
    (harmony)
    (pain ?o - thing)
    (craves ?o1 - thing ?o2 - thing)
  )

  (:action attack)
    (:parameters (?o - thing))
    (:precondition (and (province ?o) (planet ?o) (harmony)))
    (:effect (and (not (province ?o)) (not (planet ?o)) (not (harmony)) (pain ?o)))

  (:action succumb)
    (:parameters (?o - thing))
    (:precondition (pain ?o))
    (:effect (and (not (pain ?o)) (province ?o) (planet ?o) (harmony)))

  (:action overcome)
    (:parameters (?o - thing ?other_o - thing))
    (:precondition (and (province ?other_o) (pain ?o)))
    (:effect (and (not (province ?other_o)) (not (pain ?o)) (harmony) (province ?o) (craves ?o ?other_o)))

  (:action feast)
    (:parameters (?o - thing ?other_o - thing))
    (:precondition (and (craves ?o ?other_o) (province ?o) (harmony)))
    (:effect (and (not (craves ?o ?other_o)) (not (province ?o)) (not (harmony)) (pain ?o) (province ?other_o)))
)