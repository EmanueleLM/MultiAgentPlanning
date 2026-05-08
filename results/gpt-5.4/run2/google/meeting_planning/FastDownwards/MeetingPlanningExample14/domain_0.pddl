(define (domain sf_meet_mary_day)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time meeting_stage)

  (:constants nob_hill marina_district - location)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (advance_11 ?t1 - time ?t2 - time)
    (advance_12 ?t1 - time ?t2 - time)
    (mary_available ?t - time)
    (can_start_120_at ?t - time)
    (meeting_stage_is ?s - meeting_stage)
    (meeting_stage_next ?s1 - meeting_stage ?s2 - meeting_stage)
    (meeting_mary)
    (met_mary)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (at ?l)
      (not (meeting_mary))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_nob_hill_to_marina_district
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (advance_11 ?t1 ?t2)
      (at nob_hill)
      (not (meeting_mary))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (at nob_hill))
      (at marina_district)
    )
  )

  (:action travel_marina_district_to_nob_hill
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (advance_12 ?t1 ?t2)
      (at marina_district)
      (not (meeting_mary))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (at marina_district))
      (at nob_hill)
    )
  )

  (:action start_meeting_mary
    :parameters (?t - time)
    :precondition (and
      (current_time ?t)
      (at marina_district)
      (can_start_120_at ?t)
      (meeting_stage_is m_0)
      (not (meeting_mary))
      (not (met_mary))
    )
    :effect (and
      (meeting_mary)
    )
  )

  (:action continue_meeting_mary
    :parameters (?t1 - time ?t2 - time ?s1 - meeting_stage ?s2 - meeting_stage)
    :precondition (and
      (meeting_mary)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_stage_is ?s1)
      (meeting_stage_next ?s1 ?s2)
      (at marina_district)
      (mary_available ?t1)
      (not (meeting_stage_is m_119))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_is ?s1))
      (meeting_stage_is ?s2)
    )
  )

  (:action final_continue_and_complete_meeting_mary
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (meeting_mary)
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (meeting_stage_is m_119)
      (meeting_stage_next m_119 m_120)
      (at marina_district)
      (mary_available ?t1)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (meeting_stage_is m_119))
      (meeting_stage_is m_120)
      (not (meeting_mary))
      (met_mary)
    )
  )
)