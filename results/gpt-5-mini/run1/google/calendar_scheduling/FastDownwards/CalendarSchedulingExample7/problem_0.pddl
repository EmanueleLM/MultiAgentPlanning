(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: three participants and discrete 30-minute slots for Monday 09:00-17:00 inclusive.
  (:objects
    heather nicholas zachary - person

    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
  )

  (:init
    ;; participants and slots
    (person heather) (person nicholas) (person zachary)

    (slot slot-0900-0930) (slot slot-0930-1000) (slot slot-1000-1030) (slot slot-1030-1100)
    (slot slot-1100-1130) (slot slot-1130-1200) (slot slot-1200-1230) (slot slot-1230-1300)
    (slot slot-1300-1330) (slot slot-1330-1400) (slot slot-1400-1430) (slot slot-1430-1500)
    (slot slot-1500-1530) (slot slot-1530-1600) (slot slot-1600-1630) (slot slot-1630-1700)

    ;; temporal ordering (successor links) across Monday 09:00-17:00 at 30-minute granularity.
    (next slot-0900-0930 slot-0930-1000)
    (next slot-0930-1000 slot-1000-1030)
    (next slot-1000-1030 slot-1030-1100)
    (next slot-1030-1100 slot-1100-1130)
    (next slot-1100-1130 slot-1130-1200)
    (next slot-1130-1200 slot-1200-1230)
    (next slot-1200-1230 slot-1230-1300)
    (next slot-1230-1300 slot-1300-1330)
    (next slot-1300-1330 slot-1330-1400)
    (next slot-1330-1400 slot-1400-1430)
    (next slot-1400-1430 slot-1430-1500)
    (next slot-1430-1500 slot-1500-1530)
    (next slot-1500-1530 slot-1530-1600)
    (next slot-1530-1600 slot-1600-1630)
    (next slot-1600-1630 slot-1630-1700)

    ;; No meeting scheduled yet (prevents multiple schedule actions)
    (no-meeting-scheduled)

    ;; Participant availability facts: derived directly from the provided availability reports.
    ;; Heather: available slots (hard conflicts are simply not asserted as available).
    (available heather slot-0930-1000)
    (available heather slot-1000-1030)
    (available heather slot-1100-1130)
    (available heather slot-1130-1200)
    (available heather slot-1200-1230)
    (available heather slot-1230-1300)
    (available heather slot-1400-1430)
    (available heather slot-1500-1530)
    (available heather slot-1530-1600)
    (available heather slot-1630-1700)

    ;; Nicholas: available every 30-minute slot within 09:00-17:00
    (available nicholas slot-0900-0930)
    (available nicholas slot-0930-1000)
    (available nicholas slot-1000-1030)
    (available nicholas slot-1030-1100)
    (available nicholas slot-1100-1130)
    (available nicholas slot-1130-1200)
    (available nicholas slot-1200-1230)
    (available nicholas slot-1230-1300)
    (available nicholas slot-1300-1330)
    (available nicholas slot-1330-1400)
    (available nicholas slot-1400-1430)
    (available nicholas slot-1430-1500)
    (available nicholas slot-1500-1530)
    (available nicholas slot-1530-1600)
    (available nicholas slot-1600-1630)
    (available nicholas slot-1630-1700)

    ;; Zachary: reported available slots (preference applies to avoid after 14:00)
    (available zachary slot-1030-1100)
    (available zachary slot-1200-1230)
    (available zachary slot-1300-1330)
    (available zachary slot-1630-1700)

    ;; Zachary's soft preference annotation:
    ;; He prefers not to meet after 14:00. We mark slots before 14:00 as 'preferred' for Zachary.
    ;; NOTE: This is an optional/annotative predicate. The main problem goal does not require it.
    (preferred zachary slot-1030-1100)
    (preferred zachary slot-1200-1230)
    (preferred zachary slot-1300-1330)

    ;; (No explicit available facts are given for Heather's hard-conflict slots;
    ;;  they are thereby prohibited by the absence of availability facts.)
  )

  ;; Goal: find a single 30-minute slot where Heather, Nicholas, and Zachary are all assigned.
  ;; Use an existential goal to require there exists a slot with all three assigned.
  (:goal
    (and
      (meeting-scheduled)
      ;; Require there exists a slot ?s for which all three participants are assigned.
      ;; This enforces that the scheduled slot actually includes Heather, Nicholas, and Zachary.
      (exists (?s - slot)
        (and
          (assigned heather ?s)
          (assigned nicholas ?s)
          (assigned zachary ?s)
        )
      )
    )
  )

  ;; Optional preference (ANNOTATION, not enforced in the problem goal):
  ;; The following is an optional/soft objective: prefer that the chosen slot is (preferred zachary ?s).
  ;; FastDownwards in this encoding will not treat this as a hard constraint. Planners that support
  ;; optimization over preferences / metric functions could be extended to prefer such a solution.
  ;; For clarity: the primary (hard) candidate that meets all participants' strict availability is
  ;; slot-1200-1230 (12:00–12:30). Secondary joint candidate is slot-1630-1700 but Zachary flagged
  ;; that as dispreferred (after 14:00).
  ;;; OPTIONAL PREFERENCE (not part of the enforced :goal):
  ;;; (exists (?s - slot) (and (assigned zachary ?s) (preferred zachary ?s)))
)