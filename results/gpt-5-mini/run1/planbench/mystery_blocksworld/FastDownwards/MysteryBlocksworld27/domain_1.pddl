(define (domain mystery-blocksworld)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (province ?o)
    (planet ?o)
    (harmony)
    (pain ?o)
    (craves ?o1 ?o2)
  )

  ; Attack: attacker ?x uses province on itself and some planet ?y while harmony holds.
  ; Effects: creates pain on ?x, and removes province ?x, planet ?y and global harmony.
  (:action attack
    :parameters (?x ?y)
    :precondition (and
      (province ?x)
      (planet ?y)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?y))
      (not (harmony))
    )
  )

  ; Succumb: an object with pain succumbs, restoring its province and planet and global harmony.
  ; Effects: removes its pain.
  (:action succumb
    :parameters (?x)
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

  ; Overcome: an object ?x that has pain can overcome another object ?y that currently has province.
  ; Effects: gives harmony, gives province to ?x, creates craves(?x,?y), removes province from ?y and removes pain from ?x.
  (:action overcome
    :parameters (?x ?y)
    :precondition (and
      (province ?y)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ; Feast: an object ?x that craves ?y and has province and while harmony holds can feast on ?y.
  ; Effects: produces pain on ?x, gives province to ?y, and removes the craves relation, province of ?x and harmony.
  (:action feast
    :parameters (?x ?y)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)