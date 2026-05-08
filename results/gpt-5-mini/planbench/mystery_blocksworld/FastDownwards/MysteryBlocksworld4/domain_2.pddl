(define (domain mystery_blocksworld4)
  (:requirements :strips :typing)
  (:types item)

  (:predicates
    (craves ?x - item ?y - item)
    (province ?x - item)
    (planet ?x - item)
    (harmony)
    (pain ?x - item)
  )

  ;; Attack: consumes a province and a planet and harmony, produces pain on the province-object
  (:action attack
    :parameters (?prov - item ?pl - item)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain ?prov)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: given an object in pain, restore that object's province and planet status and harmony
  (:action succumb
    :parameters (?x - item)
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

  ;; Overcome: given an object in pain and some other object that is a province,
  ;; make harmony true, make the pain-object a province and have it crave the other,
  ;; and remove the other object's province and the pain on the first object.
  (:action overcome
    :parameters (?x - item ?other - item)
    :precondition (and
      (province ?other)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain ?x))
    )
  )

  ;; Feast: an object that craves another and is a province while harmony holds
  ;; will consume that craving, become in pain, transfer province to the other object,
  ;; and remove harmony.
  (:action feast
    :parameters (?x - item ?other - item)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
    )
  )
)