(define (domain mystery_blocksworld6)
  (:requirements :strips :typing)
  (:types item)

  (:predicates
    (province ?x - item)
    (planet ?x - item)
    (harmony)
    (pain ?x - item)
    (craves ?x - item ?y - item)
  )

  ;; Attack: produces pain on ?x and removes province/planet/harmony
  (:action attack
    :parameters (?x - item)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
              (pain ?x)
              (not (province ?x))
              (not (planet ?x))
              (not (harmony))
            )
  )

  ;; Succumb: requires pain on ?x, restores province/planet/harmony and clears pain
  (:action succumb
    :parameters (?x - item)
    :precondition (and (pain ?x))
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
            )
  )

  ;; Overcome: when ?x is in pain and ?y has a province, make ?x crave ?y,
  ;; give province to ?x, set harmony, and remove province of ?y and pain of ?x
  (:action overcome
    :parameters (?x - item ?y - item)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain ?x))
            )
  )

  ;; Feast: consumes a craves relation (from ?x to ?y) given province of ?x and harmony,
  ;; produces pain on ?x and gives province to ?y, removes craves, province of ?x, and harmony
  (:action feast
    :parameters (?x - item ?y - item)
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