(define (domain feast-attack-toggle)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
    (attacked ?prov - object ?pl - object)
  )

  ;; Feast: X who craves Y and holds Province while Harmony exists,
  ;; consumes Y: X loses Province and Craves(X,Y) is removed,
  ;; Harmony -> Pain, Y gains Province.
  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (not (pain))
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )

  ;; Overcome: given Pain and some Y with Province, X can re-acquire Province and Craves(X,Y),
  ;; Pain -> Harmony, Province transfers from Y to X.
  ;; This loose variant does not require provenance markers: any X may overcome wrt any Y that currently has Province.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (province ?y)
      (pain)
      (not (harmony))
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Attack: global destructive toggle. Destroys Province(prov) and Planet(pl) while Harmony holds,
  ;; produces Pain and records Attacked(prov,pl) provenance marker.
  (:action attack
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
    )
    :effect (and
      (pain)
      (attacked ?prov ?pl)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  ;; Succumb: restores the exact Province/Planet pair targeted by an earlier Attack.
  ;; Requires the Attacked provenance marker and Pain; restores Province/Planet and Harmony.
  (:action succumb
    :parameters (?prov - object ?pl - object)
    :precondition (and
      (pain)
      (attacked ?prov ?pl)
      (not (harmony))
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (attacked ?prov ?pl))
    )
  )
)