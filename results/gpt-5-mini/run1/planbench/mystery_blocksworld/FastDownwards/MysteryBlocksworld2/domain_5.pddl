(define (domain mystery_blocksworld)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain ?x - obj)
  )

  ;; Attack: actor ?a acts on target ?t
  ;; Preconditions: actor is province, target is planet, harmony holds
  ;; Effects: actor has pain; removes province(actor), planet(target), and harmony
  (:action attack
    :parameters (?a - obj ?t - obj)
    :precondition (and
      (province ?a)
      (planet ?t)
      (harmony)
    )
    :effect (and
      (pain ?a)
      (not (province ?a))
      (not (planet ?t))
      (not (harmony))
    )
  )

  ;; Succumb: an object with pain can succumb
  ;; Preconditions: pain on ?x
  ;; Effects: restores province and planet for ?x and harmony; removes pain on ?x
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

  ;; Overcome: subject ?s overcomes using province status of other ?o and subject's pain
  ;; Preconditions: province on other, pain on subject
  ;; Effects: creates harmony, grants province to subject, sets craves(subject, other);
  ;;          removes province(other) and pain(subject)
  (:action overcome
    :parameters (?s - obj ?o - obj)
    :precondition (and
      (province ?o)
      (pain ?s)
    )
    :effect (and
      (harmony)
      (province ?s)
      (craves ?s ?o)
      (not (province ?o))
      (not (pain ?s))
    )
  )

  ;; Feast: subject ?s feasts on other ?o when subject craves other, subject is province, and harmony
  ;; Preconditions: craves(s,o), province(s), harmony
  ;; Effects: makes subject in pain, grants province to other; removes the craves relation, province(s), and harmony
  (:action feast
    :parameters (?s - obj ?o - obj)
    :precondition (and
      (craves ?s ?o)
      (province ?s)
      (harmony)
    )
    :effect (and
      (pain ?s)
      (province ?o)
      (not (craves ?s ?o))
      (not (province ?s))
      (not (harmony))
    )
  )
)