(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types
    location
    time
    count
    person
  )
  (:constants
    marina mission - location
  )
  (:predicates
    (at ?l - location)
    (time_at ?t - time)
    (meeting_progress ?p - person ?c - count)
    (stephanie_at ?p - person ?l - location ?t - time)
    (next_time ?t1 ?t2 - time)
    (next_count ?c1 ?c2 - count)
    (travel_duration_marina_mission ?t1 ?t2 - time)
    (travel_duration_mission_marina ?t1 ?t2 - time)
  )

  (:action wait
    :parameters (?l - location ?t_now ?t_next - time)
    :precondition (and
      (at ?l)
      (time_at ?t_now)
      (next_time ?t_now ?t_next)
    )
    :effect (and
      (not (time_at ?t_now))
      (time_at ?t_next)
    )
  )

  (:action travel_marina_to_mission
    :parameters (?t_now ?t_later - time)
    :precondition (and
      (at marina)
      (time_at ?t_now)
      (travel_duration_marina_mission ?t_now ?t_later)
    )
    :effect (and
      (not (at marina))
      (at mission)
      (not (time_at ?t_now))
      (time_at ?t_later)
    )
  )

  (:action travel_mission_to_marina
    :parameters (?t_now ?t_later - time)
    :precondition (and
      (at mission)
      (time_at ?t_now)
      (travel_duration_mission_marina ?t_now ?t_later)
    )
    :effect (and
      (not (at mission))
      (at marina)
      (not (time_at ?t_now))
      (time_at ?t_later)
    )
  )

  (:action talk_to_stephanie
    :parameters (?p - person ?t_now ?t_next - time ?c_now ?c_next - count)
    :precondition (and
      (at mission)
      (time_at ?t_now)
      (next_time ?t_now ?t_next)
      (stephanie_at ?p mission ?t_now)
      (meeting_progress ?p ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and
      (not (time_at ?t_now))
      (time_at ?t_next)
      (not (meeting_progress ?p ?c_now))
      (meeting_progress ?p ?c_next)
    )
  )
)