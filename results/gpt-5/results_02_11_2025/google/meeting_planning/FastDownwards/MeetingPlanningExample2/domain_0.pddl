(define (domain day-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time
  )
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (available-jessica ?t - time)
    (travel-15 ?from - location ?to - location)
    (meeting-with-jessica)
    (need5) (need4) (need3) (need2) (need1)
    (met-jessica-min)
  )

  (:action wait
    :parameters (?t - time ?t2 - time ?l - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?l)
      (not (meeting-with-jessica))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
    )
  )

  (:action move
    :parameters (?t - time ?t2 - time ?from - location ?to - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?from)
      (travel-15 ?from ?to)
      (not (meeting-with-jessica))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action start_meeting_jessica
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (available-jessica ?t)
      (available-jessica ?t2)
      (not (meeting-with-jessica))
      (not (met-jessica-min))
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (meeting-with-jessica)
      (need5)
    )
  )

  (:action continue_meeting_jessica_5
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (meeting-with-jessica)
      (need5)
      (available-jessica ?t)
      (available-jessica ?t2)
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (need5))
      (need4)
    )
  )

  (:action continue_meeting_jessica_4
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (meeting-with-jessica)
      (need4)
      (available-jessica ?t)
      (available-jessica ?t2)
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (need4))
      (need3)
    )
  )

  (:action continue_meeting_jessica_3
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (meeting-with-jessica)
      (need3)
      (available-jessica ?t)
      (available-jessica ?t2)
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (need3))
      (need2)
    )
  )

  (:action continue_meeting_jessica_2
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (meeting-with-jessica)
      (need2)
      (available-jessica ?t)
      (available-jessica ?t2)
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (need2))
      (need1)
    )
  )

  (:action continue_meeting_jessica_1
    :parameters (?t - time ?t2 - time ?loc - location)
    :precondition (and
      (at-time ?t)
      (next ?t ?t2)
      (at ?loc)
      (meeting-with-jessica)
      (need1)
      (available-jessica ?t)
      (available-jessica ?t2)
      (at (sunset-district))
    )
    :effect (and
      (not (at-time ?t))
      (at-time ?t2)
      (not (need1))
      (not (meeting-with-jessica))
      (met-jessica-min)
    )
  )
)