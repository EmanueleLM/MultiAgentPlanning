(define (domain san_francisco_meeting_kenneth)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
    meet_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (meeting_stage ?m - meet_stage)
    (in_meeting ?p - person)

    (travel_edge ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (person_at ?p - person ?l - location)
    (available_at ?p - person ?t - timepoint)

    (met_minimum ?p - person)
  )

  (:action wait_to_next
    :parameters (?from_t - timepoint ?to_t - timepoint ?l - location ?p - person)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
      (at ?l)
      (not (in_meeting ?p))
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint ?p - person)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
      (not (in_meeting ?p))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_block
    :parameters (?person - person ?t_start - timepoint ?t_end - timepoint ?loc - location ?m0 - meet_stage ?m30 - meet_stage)
    :precondition (and
      (current_time ?t_start)
      (next_time ?t_start ?t_end)
      (at ?loc)
      (person_at ?person ?loc)
      (available_at ?person ?t_start)
      (meeting_stage ?m0)
      (not (in_meeting ?person))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (not (meeting_stage ?m0))
      (meeting_stage ?m30)
      (in_meeting ?person)
    )
  )

  (:action continue_meeting_to_60
    :parameters (?person - person ?t_start - timepoint ?t_end - timepoint ?loc - location ?m30 - meet_stage ?m60 - meet_stage)
    :precondition (and
      (current_time ?t_start)
      (next_time ?t_start ?t_end)
      (at ?loc)
      (person_at ?person ?loc)
      (available_at ?person ?t_start)
      (in_meeting ?person)
      (meeting_stage ?m30)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (not (meeting_stage ?m30))
      (meeting_stage ?m60)
    )
  )

  (:action finish_meeting_to_90
    :parameters (?person - person ?t_start - timepoint ?t_end - timepoint ?loc - location ?m60 - meet_stage ?m90 - meet_stage)
    :precondition (and
      (current_time ?t_start)
      (next_time ?t_start ?t_end)
      (at ?loc)
      (person_at ?person ?loc)
      (available_at ?person ?t_start)
      (in_meeting ?person)
      (meeting_stage ?m60)
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (not (meeting_stage ?m60))
      (meeting_stage ?m90)
      (not (in_meeting ?person))
      (met_minimum ?person)
    )
  )
)