(define (domain friends-meeting-classical)
  (:requirements :typing :negative-preconditions :equality)
  (:types person location time)
  (:predicates
    (at ?p - person ?loc - location ?t - time)
    (met ?p - person)
    (next ?t1 - time ?t2 - time)
    (travel-slot ?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    (deborah-available ?ts - time ?te - time)
    (meeting-slot ?ts - time ?te - time)
    (is-you ?p - person)
    (is-deborah ?p - person)
  )

  (:action travel-you
    :parameters (?you - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (is-you ?you)
      (at ?you ?from ?t1)
      (travel-slot ?you ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?you ?from ?t1))
      (at ?you ?to ?t2)
    )
  )

  (:action travel-deborah
    :parameters (?deb - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (is-deborah ?deb)
      (at ?deb ?from ?t1)
      (travel-slot ?deb ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?deb ?from ?t1))
      (at ?deb ?to ?t2)
    )
  )

  (:action wait-you
    :parameters (?you - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (is-you ?you)
      (at ?you ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?you ?loc ?t1))
      (at ?you ?loc ?t2)
    )
  )

  (:action wait-deborah
    :parameters (?deb - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (is-deborah ?deb)
      (at ?deb ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?deb ?loc ?t1))
      (at ?deb ?loc ?t2)
    )
  )

  (:action meet-deborah
    :parameters (?you - person ?deb - person ?loc - location ?ts - time ?te - time)
    :precondition (and
      (is-you ?you)
      (is-deborah ?deb)
      (at ?you ?loc ?ts)
      (at ?deb ?loc ?ts)
      (deborah-available ?ts ?te)
      (meeting-slot ?ts ?te)
      (not (met ?deb))
    )
    :effect (and
      (not (at ?you ?loc ?ts))
      (not (at ?deb ?loc ?ts))
      (at ?you ?loc ?te)
      (at ?deb ?loc ?te)
      (met ?deb)
    )
  )
)