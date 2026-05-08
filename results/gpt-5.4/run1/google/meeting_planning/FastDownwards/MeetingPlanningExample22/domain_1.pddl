(define (domain sf_meet_andrew_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    countdown
    meet_progress
  )

  (:constants
    union_square presidio - location
    andrew - person
    d_1 d_2 d_3 d_4 d_5 d_6 d_7 d_8 d_9 d_10 d_11 d_12 d_13 d_14 d_15 d_16 d_17 d_18 d_19 d_20 d_21 d_22 d_23 d_24 - countdown
  )

  (:predicates
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)

    (at ?l - location)
    (traveling ?from - location ?to - location ?d - countdown)

    (route_duration_start ?from - location ?to - location ?d - countdown)
    (countdown_next ?d1 - countdown ?d2 - countdown)

    (available ?p - person ?l - location ?t - time)

    (met_progress ?m - meet_progress)
    (meet_next ?m1 - meet_progress ?m2 - meet_progress)
  )

  (:action depart
    :parameters (?from - location ?to - location ?full - countdown ?rem - countdown ?t - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t)
      (next_time ?t ?t2)
      (route_duration_start ?from ?to ?full)
      (countdown_next ?full ?rem)
    )
    :effect (and
      (not (at ?from))
      (not (current_time ?t))
      (current_time ?t2)
      (traveling ?from ?to ?rem)
    )
  )

  (:action continue_travel
    :parameters (?from - location ?to - location ?d - countdown ?d2 - countdown ?t - time ?t2 - time)
    :precondition (and
      (traveling ?from ?to ?d)
      (countdown_next ?d ?d2)
      (current_time ?t)
      (next_time ?t ?t2)
    )
    :effect (and
      (not (traveling ?from ?to ?d))
      (not (current_time ?t))
      (traveling ?from ?to ?d2)
      (current_time ?t2)
    )
  )

  (:action arrive
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (traveling ?from ?to d_1)
      (current_time ?t)
      (next_time ?t ?t2)
    )
    :effect (and
      (not (traveling ?from ?to d_1))
      (not (current_time ?t))
      (at ?to)
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t)
      (next_time ?t ?t2)
    )
    :effect (and
      (not (current_time ?t))
      (current_time ?t2)
    )
  )

  (:action meet_minute
    :parameters (?t - time ?t2 - time ?m1 - meet_progress ?m2 - meet_progress)
    :precondition (and
      (at union_square)
      (current_time ?t)
      (next_time ?t ?t2)
      (available andrew union_square ?t)
      (met_progress ?m1)
      (meet_next ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t))
      (current_time ?t2)
      (not (met_progress ?m1))
      (met_progress ?m2)
    )
  )
)