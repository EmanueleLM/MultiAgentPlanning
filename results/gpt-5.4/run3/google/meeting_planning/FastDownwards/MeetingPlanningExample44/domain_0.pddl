(define (domain san_francisco_meeting_betty)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meet_stage
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (meeting_stage ?s - meet_stage)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (next_stage ?s1 - meet_stage ?s2 - meet_stage)
    (betty_available ?t - time)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_betty_minute
    :parameters (?t1 - time ?t2 - time ?s1 - meet_stage ?s2 - meet_stage)
    :precondition (and
      (at fishermans_wharf)
      (person_at betty fishermans_wharf)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (betty_available ?t1)
      (meeting_stage ?s1)
      (next_stage ?s1 ?s2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage ?s1))
      (meeting_stage ?s2)
    )
  )
)