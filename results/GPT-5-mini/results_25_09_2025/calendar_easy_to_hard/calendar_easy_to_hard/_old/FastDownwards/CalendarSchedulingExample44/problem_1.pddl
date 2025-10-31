(define (problem schedule-orchestrated-monday)
  (:domain orchestrated-meeting)

  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
    kayla sandra ryan kathleen walter arthur heather - participant
  )

  (:init
    ;; ----------------------
    ;; adjacency for all participants (30-min steps 09:00..17:00)
    ;; s0: 09:00-09:30, s1:09:30-10:00, ..., s15:16:30-17:00
    ;; Add adjacency facts for each participant's adjacency predicate.
    ;; Kayla
    (kayla_next s0 s1) (kayla_next s1 s2) (kayla_next s2 s3) (kayla_next s3 s4)
    (kayla_next s4 s5) (kayla_next s5 s6) (kayla_next s6 s7) (kayla_next s7 s8)
    (kayla_next s8 s9) (kayla_next s9 s10) (kayla_next s10 s11) (kayla_next s11 s12)
    (kayla_next s12 s13) (kayla_next s13 s14) (kayla_next s14 s15)

    ;; Sandra
    (sandra_next s0 s1) (sandra_next s1 s2) (sandra_next s2 s3) (sandra_next s3 s4)
    (sandra_next s4 s5) (sandra_next s5 s6) (sandra_next s6 s7) (sandra_next s7 s8)
    (sandra_next s8 s9) (sandra_next s9 s10) (sandra_next s10 s11) (sandra_next s11 s12)
    (sandra_next s12 s13) (sandra_next s13 s14) (sandra_next s14 s15)

    ;; Ryan (consecutive)
    (ryan_consecutive s0 s1) (ryan_consecutive s1 s2) (ryan_consecutive s2 s3) (ryan_consecutive s3 s4)
    (ryan_consecutive s4 s5) (ryan_consecutive s5 s6) (ryan_consecutive s6 s7) (ryan_consecutive s7 s8)
    (ryan_consecutive s8 s9) (ryan_consecutive s9 s10) (ryan_consecutive s10 s11) (ryan_consecutive s11 s12)
    (ryan_consecutive s12 s13) (ryan_consecutive s13 s14) (ryan_consecutive s14 s15)

    ;; Walter (adjacent)
    (walter_adjacent s0 s1) (walter_adjacent s1 s2) (walter_adjacent s2 s3) (walter_adjacent s3 s4)
    (walter_adjacent s4 s5) (walter_adjacent s5 s6) (walter_adjacent s6 s7) (walter_adjacent s7 s8)
    (walter_adjacent s8 s9) (walter_adjacent s9 s10) (walter_adjacent s10 s11) (walter_adjacent s11 s12)
    (walter_adjacent s12 s13) (walter_adjacent s13 s14) (walter_adjacent s14 s15)

    ;; Arthur (next)
    (arthur_next s0 s1) (arthur_next s1 s2) (arthur_next s2 s3) (arthur_next s3 s4)
    (arthur_next s4 s5) (arthur_next s5 s6) (arthur_next s6 s7) (arthur_next s7 s8)
    (arthur_next s8 s9) (arthur_next s9 s10) (arthur_next s10 s11) (arthur_next s11 s12)
    (arthur_next s12 s13) (arthur_next s13 s14) (arthur_next s14 s15)

    ;; Heather (next)
    (heather_next s0 s1) (heather_next s1 s2) (heather_next s2 s3) (heather_next s3 s4)
    (heather_next s4 s5) (heather_next s5 s6) (heather_next s6 s7) (heather_next s7 s8)
    (heather_next s8 s9) (heather_next s9 s10) (heather_next s10 s11) (heather_next s11 s12)
    (heather_next s12 s13) (heather_next s13 s14) (heather_next s14 s15)

    ;; ----------------------
    ;; Participant-specific availability / busy information (from inputs)
    ;; Kayla: Busy slots -> s0, s1, s11, s13 (these are NOT listed as kayla_free)
    ;; Kayla free: s2,s3,s4,s5,s6,s7,s8,s9,s10,s12,s14,s15
    (kayla_free s2) (kayla_free s3) (kayla_free s4) (kayla_free s5)
    (kayla_free s6) (kayla_free s7) (kayla_free s8) (kayla_free s9)
    (kayla_free s10) (kayla_free s12) (kayla_free s14) (kayla_free s15)

    ;; Sandra: Busy slots -> s6 (12:00-12:30), s10 (14:00-14:30), s11 (14:30-15:00), s15 (16:30-17:00)
    ;; Sandra free: all other slots
    (sandra_free s0) (sandra_free s1) (sandra_free s2) (sandra_free s3)
    (sandra_free s4) (sandra_free s5) (sandra_free s7) (sandra_free s8)
    (sandra_free s9) (sandra_free s12) (sandra_free s13) (sandra_free s14)

    ;; Ryan: Busy -> s1, s2, s4, s7
    ;; Ryan free (from Ryan's problem): s0,s3,s5,s6,s8,s9,s10,s11,s12,s13,s14,s15
    (ryan_free s0) (ryan_free s3) (ryan_free s5) (ryan_free s6)
    (ryan_free s8) (ryan_free s9) (ryan_free s10) (ryan_free s11)
    (ryan_free s12) (ryan_free s13) (ryan_free s14) (ryan_free s15)
    (ryan_unscheduled)

    ;; Kathleen: startable times (meeting may start at s0..s14), and she encodes freeforall for all startable times.
    (kathleen_startable s0) (kathleen_startable s1) (kathleen_startable s2)
    (kathleen_startable s3) (kathleen_startable s4) (kathleen_startable s5)
    (kathleen_startable s6) (kathleen_startable s7) (kathleen_startable s8)
    (kathleen_startable s9) (kathleen_startable s10) (kathleen_startable s11)
    (kathleen_startable s12) (kathleen_startable s13) (kathleen_startable s14)
    (kathleen_freeforall s0) (kathleen_freeforall s1) (kathleen_freeforall s2)
    (kathleen_freeforall s3) (kathleen_freeforall s4) (kathleen_freeforall s5)
    (kathleen_freeforall s6) (kathleen_freeforall s7) (kathleen_freeforall s8)
    (kathleen_freeforall s9) (kathleen_freeforall s10) (kathleen_freeforall s11)
    (kathleen_freeforall s12) (kathleen_freeforall s13) (kathleen_freeforall s14)

    ;; Walter: Busy -> s1..s5 (9:30-12:00), s10 (14:00-14:30), s12..s15 (15:00-17:00)
    ;; Walter free: s0, s6, s7, s8, s9, s11
    (walter_free s0) (walter_free s6) (walter_free s7)
    (walter_free s8) (walter_free s9) (walter_free s11)

    ;; Arthur: Occupied/busy -> s0,s1,s2,s3,s5,s7,s10,s11
    ;; Mark occupied and free for other slots as in Arthur's input
    (arthur_occupied s0) (arthur_occupied s1) (arthur_occupied s2) (arthur_occupied s3)
    (arthur_occupied s5) (arthur_occupied s7) (arthur_occupied s10) (arthur_occupied s11)
    ;; Arthur free slots: s4,s6,s8,s9,s12,s13,s14,s15
    (arthur_free s4) (arthur_free s6) (arthur_free s8) (arthur_free s9)
    (arthur_free s12) (arthur_free s13) (arthur_free s14) (arthur_free s15)

    ;; Heather: startable s0..s14, busy slots -> s2,s3,s4 (10:00-11:30), s6,s7 (12:00-13:00),
    ;; s11,s12 (14:30-15:30), s15 (16:30-17:00)
    (heather_startable s0) (heather_startable s1) (heather_startable s2)
    (heather_startable s3) (heather_startable s4) (heather_startable s5)
    (heather_startable s6) (heather_startable s7) (heather_startable s8)
    (heather_startable s9) (heather_startable s10) (heather_startable s11)
    (heather_startable s12) (heather_startable s13) (heather_startable s14)
    (heather_busy s2) (heather_busy s3) (heather_busy s4)
    (heather_busy s6) (heather_busy s7)
    (heather_busy s11) (heather_busy s12)
    (heather_busy s15)

    ;; ----------------------
    ;; Note: We intentionally only list "free" or "busy/occupied" facts as provided by each participant's input.
    ;; Any slot not listed as a participant-specific free is considered unavailable for that participant.
  )

  ;; Goal: the orchestrator must find a single one-hour meeting slot (two consecutive 30-min slots)
  ;; on Monday between 09:00 and 17:00 that all participants accept.
  (:goal (joint_meeting_scheduled))
)