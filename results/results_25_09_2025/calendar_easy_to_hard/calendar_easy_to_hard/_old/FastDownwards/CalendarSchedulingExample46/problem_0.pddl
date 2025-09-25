(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)

  (:objects
    ;; people (unified)
    alan michael michelle roy judy natalie brian - person

    ;; unified slot names: 30-minute starts from 09:00 to 16:30 (Monday work hours)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; mark all slots and work slots
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    (work-slot s09_00) (work-slot s09_30) (work-slot s10_00) (work-slot s10_30)
    (work-slot s11_00) (work-slot s11_30) (work-slot s12_00) (work-slot s12_30)
    (work-slot s13_00) (work-slot s13_30) (work-slot s14_00) (work-slot s14_30)
    (work-slot s15_00) (work-slot s15_30) (work-slot s16_00) (work-slot s16_30)

    ;; mark participants (some fragments required predicate (participant ...))
    (participant alan) (participant michael) (participant michelle)
    (participant roy) (participant judy) (participant natalie) (participant brian)

    ;; ---------------------------
    ;; Availability facts collected from each agent fragment (mapped to unified slot names)
    ;; Alan's free slots (from Alan fragment)
    (free alan s09_30)
    (free alan s10_30)
    (free alan s12_30)
    (free alan s13_00)
    (free alan s13_30)
    (free alan s14_30)
    (free alan s15_00)
    (free alan s15_30)
    (free alan s16_00)
    (free alan s16_30)

    ;; Michael is free entire Monday (Michael fragment) -- Michael uses 'free'
    (free michael s09_00) (free michael s09_30) (free michael s10_00) (free michael s10_30)
    (free michael s11_00) (free michael s11_30) (free michael s12_00) (free michael s12_30)
    (free michael s13_00) (free michael s13_30) (free michael s14_00) (free michael s14_30)
    (free michael s15_00) (free michael s15_30) (free michael s16_00) (free michael s16_30)

    ;; Michelle is free entire Monday (Michelle fragment) -- Michelle uses 'free'
    (free michelle s09_00) (free michelle s09_30) (free michelle s10_00) (free michelle s10_30)
    (free michelle s11_00) (free michelle s11_30) (free michelle s12_00) (free michelle s12_30)
    (free michelle s13_00) (free michelle s13_30) (free michelle s14_00) (free michelle s14_30)
    (free michelle s15_00) (free michelle s15_30) (free michelle s16_00) (free michelle s16_30)

    ;; Roy's available slots (Roy fragment) -- uses 'available'
    (available roy s09_00)
    (available roy s10_00)
    (available roy s10_30)
    (available roy s11_00)
    (available roy s11_30)
    (available roy s12_00)
    (available roy s13_00)
    (available roy s14_30)
    (available roy s15_00)
    (available roy s15_30)
    (available roy s16_00)
    (available roy s16_30)

    ;; Judy's available slots (Judy fragment) -- uses 'available'
    (available judy s10_30)
    (available judy s15_30)

    ;; Natalie's free slots (Natalie fragment) -- uses 'free' + 'all-free' computation in her fragment
    (free natalie s09_30)
    (free natalie s10_00)
    (free natalie s10_30)
    (free natalie s12_30)

    ;; Brian's available slots (Brian fragment) -- uses 'available'
    (available brian s09_00)
    (available brian s10_30)
    (available brian s12_00)
    (available brian s12_30)
    (available brian s13_00)
    (available brian s14_00)
    (available brian s15_00)
    (available brian s16_00)

    ;; ---------------------------
    ;; Aggregate feasibility facts:
    ;; The integration resolves naming and computes the intersection of all participants' availability.
    ;; The only slot that is free/available for every modeled participant (Alan, Michael, Michelle, Roy, Judy, Natalie, Brian)
    ;; is s10_30 (10:30-11:00). We therefore mark that slot as feasible for all agents so actions that
    ;; require aggregated feasibility can use it.
    (slot-feasible-for-all s10_30)
    (all-free s10_30)

    ;; Note: we do NOT assert (meeting-scheduled) at init (no meeting scheduled yet).
  )

  (:goal
    (meeting-scheduled)
  )
)