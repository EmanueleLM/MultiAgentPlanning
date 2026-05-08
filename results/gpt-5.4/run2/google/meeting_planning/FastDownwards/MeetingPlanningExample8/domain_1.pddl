(define (domain san_francisco_meet_stephanie)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    meeting_stage
  )

  (:constants
    stephanie - person
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (meeting_progress ?m - meeting_stage)
    (meeting_started ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (available ?p - person ?t - time)
    (at_person ?p - person ?l - location)
    (travel_arrives_ct_md ?depart - time ?arrive - time)
    (travel_arrives_md_ct ?depart - time ?arrive - time)
    (next_meeting_stage ?m1 - meeting_stage ?m2 - meeting_stage)
  )

  (:action wait_one_minute
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting_started stephanie))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_chinatown_to_marina_district
    :parameters (?t_depart - time ?t_arrive - time)
    :precondition (and
      (at chinatown)
      (current_time ?t_depart)
      (travel_arrives_ct_md ?t_depart ?t_arrive)
      (not (meeting_started stephanie))
    )
    :effect (and
      (not (at chinatown))
      (at marina_district)
      (not (current_time ?t_depart))
      (current_time ?t_arrive)
    )
  )

  (:action travel_marina_district_to_chinatown
    :parameters (?t_depart - time ?t_arrive - time)
    :precondition (and
      (at marina_district)
      (current_time ?t_depart)
      (travel_arrives_md_ct ?t_depart ?t_arrive)
      (not (meeting_started stephanie))
    )
    :effect (and
      (not (at marina_district))
      (at chinatown)
      (not (current_time ?t_depart))
      (current_time ?t_arrive)
    )
  )

  (:action meet_one_minute
    :parameters (?t1 - time ?t2 - time ?m1 - meeting_stage ?m2 - meeting_stage)
    :precondition (and
      (at marina_district)
      (at_person stephanie marina_district)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available stephanie ?t1)
      (meeting_progress ?m1)
      (next_meeting_stage ?m1 ?m2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_progress ?m1))
      (meeting_progress ?m2)
      (meeting_started stephanie)
    )
  )
)