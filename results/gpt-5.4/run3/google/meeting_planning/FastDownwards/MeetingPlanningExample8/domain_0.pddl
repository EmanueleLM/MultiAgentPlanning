(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
    route
    travel_step
    meet_count
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)

    (route_from ?r - route ?l - location)
    (route_to ?r - route ?l - location)
    (first_step ?r - route ?s - travel_step)
    (next_step ?r - route ?s1 - travel_step ?s2 - travel_step)
    (last_step ?r - route ?s - travel_step)

    (traveling ?r - route)
    (travel_progress ?s - travel_step)

    (person_at ?p - person ?l - location)
    (available ?p - person ?t - time)

    (meeting ?p - person)
    (meeting_started ?p - person)
    (meet_progress ?p - person ?m - meet_count)
    (meet_next ?m1 - meet_count ?m2 - meet_count)

    (meet_goal_reached ?p - person)
  )

  (:action wait_at_location
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting stephanie))
      (not (traveling r_chinatown_to_marina_district))
      (not (traveling r_marina_district_to_chinatown))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_travel
    :parameters (?r - route ?from - location ?s - travel_step ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (route_from ?r ?from)
      (first_step ?r ?s)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (meeting stephanie))
      (not (traveling r_chinatown_to_marina_district))
      (not (traveling r_marina_district_to_chinatown))
    )
    :effect (and
      (not (at ?from))
      (traveling ?r)
      (travel_progress ?s)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action continue_travel
    :parameters (?r - route ?s1 - travel_step ?s2 - travel_step ?t1 - time ?t2 - time)
    :precondition (and
      (traveling ?r)
      (travel_progress ?s1)
      (next_step ?r ?s1 ?s2)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (travel_progress ?s1))
      (travel_progress ?s2)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action finish_travel
    :parameters (?r - route ?s - travel_step ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (traveling ?r)
      (travel_progress ?s)
      (last_step ?r ?s)
      (route_to ?r ?to)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (traveling ?r))
      (not (travel_progress ?s))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?t1)
      (meet_progress ?p m0)
      (not (meeting ?p))
      (not (meeting_started ?p))
      (not (traveling r_chinatown_to_marina_district))
      (not (traveling r_marina_district_to_chinatown))
    )
    :effect (and
      (meeting ?p)
      (meeting_started ?p)
      (not (meet_progress ?p m0))
      (meet_progress ?p m1)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action continue_meeting
    :parameters (?p - person ?l - location ?m1 - meet_count ?m2 - meet_count ?t1 - time ?t2 - time)
    :precondition (and
      (meeting ?p)
      (at ?l)
      (person_at ?p ?l)
      (meet_progress ?p ?m1)
      (meet_next ?m1 ?m2)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (available ?p ?t1)
    )
    :effect (and
      (not (meet_progress ?p ?m1))
      (meet_progress ?p ?m2)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action achieve_meeting_goal
    :parameters (?p - person)
    :precondition (and
      (meet_progress ?p m105)
    )
    :effect (and
      (meet_goal_reached ?p)
    )
  )

  (:action end_meeting
    :parameters (?p - person)
    :precondition (and
      (meeting ?p)
    )
    :effect (and
      (not (meeting ?p))
    )
  )
)