(define (problem schedule-diane-deborah-integrated)
  (:domain meeting-scheduling-integrated)

  (:objects
    diane_kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; --- Slot declarations (agent2 / agent3)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; person declarations (agent3)
    (person diane_kelly)
    (person deborah)

    ;; --- Public / cross-agent facts ---
    ;; Agent3: "there exists at least one slot that fits all participants"
    (fits_all_exists)

    ;; Agent1: public "fits_all" knowledge; resolved to a common agreed slot t1400
    ;; (We choose t1400 as a slot that is consistent with the agents' busy/free information.)
    (fits_all t1400)

    ;; --- Agent1 availability knowledge (free facts for Diane as agent1 records) ---
    ;; Agent1 indicated Diane is free at t1400 (mapped from their s14-00).
    (free_a1 diane_kelly t1400)

    ;; --- Agent3 explicit free/busy information for Deborah (only slots explicitly free) ---
    ;; Agent3 provided explicit free slots for Deborah: 09:30 and 14:00
    (free_a3 deborah t0930)
    (free_a3 deborah t1400)

    ;; --- Agent2 availability info (Diane Kelly) ---
    ;; Agent2 stated Diane Kelly is unavailable at 09:30 and 10:30, available on other slots.
    ;; We include availability facts such that t1400 is available (so agent2 can schedule).
    (available diane_kelly t0900)
    (available diane_kelly t1000)
    (available diane_kelly t1100)
    (available diane_kelly t1130)
    (available diane_kelly t1200)
    (available diane_kelly t1230)
    (available diane_kelly t1300)
    (available diane_kelly t1330)
    (available diane_kelly t1400)
    (available diane_kelly t1430)
    (available diane_kelly t1500)
    (available diane_kelly t1530)
    (available diane_kelly t1600)
    (available diane_kelly t1630)

    ;; --- Agent2 availability info (Deborah) ---
    ;; Agent2 originally declared Deborah available on all slots; agent3 provided explicit
    ;; busy details for Deborah except at t0930 and t1400. To respect explicit info while
    ;; allowing joint scheduling, we include (available deborah t1400) so agent2 can use t1400.
    (available deborah t1400)
    ;; (Note: other available facts for Deborah are intentionally not included to respect agent3's explicit busy info.)

    ;; --- Agent2 meeting flag initial state ---
    (no_meeting_made)
  )

  ;; Goal: produce a concrete meeting for Diane Kelly and Deborah during Monday working hours.
  ;; We require representatives of all three agents' scheduling to be realized for the chosen slot t1400:
  ;;  - agent2: meeting_made (their global meeting indicator)
  ;;  - agent3: meeting_with deborah diane_kelly t1400 (their meeting record)
  ;;  - agent1: scheduled_a1 t1400 (their scheduled indicator)
  (:goal (and
           (meeting_made)
           (meeting_with deborah diane_kelly t1400)
           (scheduled_a1 t1400)
         ))
)