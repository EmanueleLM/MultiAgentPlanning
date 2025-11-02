(define (domain orchestrated-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot participant)

  (:predicates
    ;; Kayla's predicates
    (kayla_next ?s - slot ?s2 - slot)
    (kayla_free ?s - slot)
    (kayla_scheduled ?s - slot)
    (kayla_meeting_started)

    ;; Sandra's predicates
    (sandra_next ?s - slot ?s2 - slot)
    (sandra_free ?s - slot)
    (sandra_scheduled)
    (sandra_meeting_at ?s - slot)

    ;; Ryan's predicates
    (ryan_consecutive ?s - slot ?s2 - slot)
    (ryan_free ?s - slot)
    (ryan_unscheduled)
    (ryan_meeting_scheduled)
    (ryan_scheduled_at ?s - slot)

    ;; Kathleen's predicates
    (kathleen_startable ?s - slot)
    (kathleen_freeforall ?s - slot)
    (kathleen_meeting_scheduled)
    (kathleen_scheduled_at ?s - slot)

    ;; Walter's predicates
    (walter_adjacent ?s - slot ?s2 - slot)
    (walter_free ?s - slot)
    (walter_scheduled)

    ;; Arthur's predicates
    (arthur_next ?s - slot ?s2 - slot)
    (arthur_free ?s - slot)
    (arthur_occupied ?s - slot)
    (arthur_meeting_start ?s - slot)
    (arthur_meeting_scheduled)

    ;; Heather's predicates
    (heather_next ?s - slot ?s2 - slot)
    (heather_busy ?s - slot)
    (heather_startable ?s - slot)
    (heather_meeting_scheduled)
    (heather_meeting_at ?s - slot)

    ;; Orchestrator / joint predicate
    (joint_meeting_scheduled)
    (joint_meeting_start ?s - slot)
  )

  ;; Individual participant scheduling actions (kept distinct per participant)
  (:action kayla_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (kayla_next ?s ?s2) (kayla_free ?s) (kayla_free ?s2))
    :effect (and
              (kayla_meeting_started)
              (kayla_scheduled ?s)
              (not (kayla_free ?s))
              (not (kayla_free ?s2))
            )
  )

  (:action sandra_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (sandra_next ?s ?s2) (sandra_free ?s) (sandra_free ?s2))
    :effect (and
              (sandra_scheduled)
              (sandra_meeting_at ?s)
              (not (sandra_free ?s))
              (not (sandra_free ?s2))
            )
  )

  (:action ryan_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (ryan_unscheduled) (ryan_free ?s) (ryan_free ?s2) (ryan_consecutive ?s ?s2))
    :effect (and
              (ryan_meeting_scheduled)
              (ryan_scheduled_at ?s)
              (not (ryan_unscheduled))
              (not (ryan_free ?s))
              (not (ryan_free ?s2))
            )
  )

  (:action kathleen_schedule
    :parameters (?s - slot)
    :precondition (and (kathleen_startable ?s) (kathleen_freeforall ?s))
    :effect (and
              (kathleen_meeting_scheduled)
              (kathleen_scheduled_at ?s)
              (not (kathleen_freeforall ?s))
            )
  )

  (:action walter_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (walter_adjacent ?s ?s2) (walter_free ?s) (walter_free ?s2))
    :effect (and
              (walter_scheduled)
              (not (walter_free ?s))
              (not (walter_free ?s2))
            )
  )

  (:action arthur_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (arthur_next ?s ?s2) (arthur_free ?s) (arthur_free ?s2))
    :effect (and
              (arthur_meeting_start ?s)
              (arthur_meeting_scheduled)
              (arthur_occupied ?s)
              (arthur_occupied ?s2)
              (not (arthur_free ?s))
              (not (arthur_free ?s2))
            )
  )

  (:action heather_schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and (heather_startable ?s) (heather_next ?s ?s2) (not (heather_busy ?s)) (not (heather_busy ?s2)) (not (heather_meeting_scheduled)))
    :effect (and
              (heather_meeting_scheduled)
              (heather_meeting_at ?s)
              (heather_busy ?s)
              (heather_busy ?s2)
            )
  )

  ;; Orchestrator action: schedules a single joint one-hour meeting (two consecutive 30-min slots)
  ;; Requires each participant's representation to permit the same two consecutive slots.
  (:action schedule-joint-meeting
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
                    ;; no joint meeting yet
                    (not (joint_meeting_scheduled))

                    ;; adjacency/sequence constraints per participant model
                    (kayla_next ?s ?s2)
                    (sandra_next ?s ?s2)
                    (ryan_consecutive ?s ?s2)
                    (walter_adjacent ?s ?s2)
                    (arthur_next ?s ?s2)
                    (heather_next ?s ?s2)

                    ;; kayla availability
                    (kayla_free ?s) (kayla_free ?s2)

                    ;; sandra availability
                    (sandra_free ?s) (sandra_free ?s2)

                    ;; ryan availability
                    (ryan_free ?s) (ryan_free ?s2) (ryan_unscheduled)

                    ;; kathleen availability (kathleen encodes freeforall by start time)
                    (kathleen_startable ?s) (kathleen_freeforall ?s)

                    ;; walter availability
                    (walter_free ?s) (walter_free ?s2)

                    ;; arthur availability
                    (arthur_free ?s) (arthur_free ?s2)

                    ;; heather availability (negative preconditions)
                    (heather_startable ?s)
                    (not (heather_busy ?s))
                    (not (heather_busy ?s2))
                  )
    :effect (and
              ;; joint markers
              (joint_meeting_scheduled)
              (joint_meeting_start ?s)

              ;; reflect scheduling in each participant's model (effects kept distinct)
              ;; Kayla
              (kayla_meeting_started)
              (kayla_scheduled ?s)
              (not (kayla_free ?s))
              (not (kayla_free ?s2))

              ;; Sandra
              (sandra_scheduled)
              (sandra_meeting_at ?s)
              (not (sandra_free ?s))
              (not (sandra_free ?s2))

              ;; Ryan
              (ryan_meeting_scheduled)
              (ryan_scheduled_at ?s)
              (not (ryan_unscheduled))
              (not (ryan_free ?s))
              (not (ryan_free ?s2))

              ;; Kathleen
              (kathleen_meeting_scheduled)
              (kathleen_scheduled_at ?s)
              (not (kathleen_freeforall ?s))

              ;; Walter
              (walter_scheduled)
              (not (walter_free ?s))
              (not (walter_free ?s2))

              ;; Arthur
              (arthur_meeting_scheduled)
              (arthur_meeting_start ?s)
              (arthur_occupied ?s)
              (arthur_occupied ?s2)
              (not (arthur_free ?s))
              (not (arthur_free ?s2))

              ;; Heather
              (heather_meeting_scheduled)
              (heather_meeting_at ?s)
              (heather_busy ?s)
              (heather_busy ?s2)
            )
  )
)