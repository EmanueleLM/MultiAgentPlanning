(define (domain craving-domain)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (craves ?from - obj ?to - obj)
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (harmony)
  )

  ;; Attack an object: requires the object to have a province and a planet and global harmony.
  ;; Produces pain on that object and removes its province, its planet predicate and global harmony.
  (:action attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb: the object with pain restores its province and planet and global harmony, removing pain.
  (:action succumb
    :parameters (?x - obj)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome subject from other: subject must have pain and the other must have a province.
  ;; Produces global harmony, gives a province to the subject, and creates craves(subject, other).
  ;; Removes the other's province and removes pain from the subject.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y))
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast: subject that craves other, and has a province and harmony, feasts on the other.
  ;; Produces pain on the subject and gives a province to the other.
  ;; Removes the craves relation, the subject's province, and global harmony.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)