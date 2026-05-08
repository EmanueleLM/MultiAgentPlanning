(define (domain mystery-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack ?x ?y
  ;; Interpretation: subject ?x (a "province" object) acts in context of some
  ;; planet ?y while harmony holds.  After the attack, ?x is in pain and the
  ;; listed structural facts are removed.
  (:action attack
    :parameters (?x - obj ?y - obj)
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

  ;; Succumb ?x
  ;; Interpretation: the object in pain ?x succumbs; this restores province,
  ;; planet, and harmony for that same object and removes its pain.
  (:action succumb
    :parameters (?x - obj)
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

  ;; Overcome ?x ?y
  ;; Interpretation: subject ?x (in pain) overcomes other object ?y (which must
  ;; be a province).  The result is harmony, province status for ?x, and the
  ;; craving relation (craves ?x ?y).  The province status of ?y and pain on ?x
  ;; are removed.
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?y)    ;; "province other object" -> province of the other param
      (pain ?x)        ;; "pain object" -> pain of the subject ?x
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast ?x ?y
  ;; Interpretation: subject ?x feasts on other object ?y when ?x craves ?y
  ;; and ?x is a province while harmony holds.  After feasting, ?x becomes in
  ;; pain and ?y becomes a province; the craving, province of ?x, and harmony
  ;; are removed.
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (craves ?x ?y)   ;; "Object Craves other object"
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)    ;; "Province other object" becomes true
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)