(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (object_craves ?x - object ?y - object)
  )

  ;; Attack requires a province object and a planet object to exist (they may be the same),
  ;; and global harmony. The province object becomes pained; the specified planet loses
  ;; its planet status; harmony is lost.
  (:action attack
    :parameters (?prov - object ?pl - object)
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

  (:action succumb
    :parameters (?x - object)
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

  ;; Overcome: requires that ?x is in pain and ?y is a province. After overcoming,
  ;; harmony holds, ?x becomes a province, ?x craves ?y, and the old province status of ?y
  ;; and the pain on ?x are removed.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (pain ?x)
      (province ?y)
    )
    :effect (and
      (harmony)
      (province ?x)
      (object_craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast: requires that ?x craves ?y, ?x is a province, and harmony.
  ;; After feasting, ?x is in pain, ?y becomes a province, and the craving, province of ?x,
  ;; and harmony are removed.
  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (object_craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (object_craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)