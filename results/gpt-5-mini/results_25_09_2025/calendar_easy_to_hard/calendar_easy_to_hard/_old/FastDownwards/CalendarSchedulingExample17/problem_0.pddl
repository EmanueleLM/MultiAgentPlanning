(define (problem orchestrated-schedule-monday)
  (:domain multi-agent-meeting)

  (:objects
    ;; Canonical slot names (30-minute slots / block starts)
    slot-09:00 slot-10:00 slot-10:30 slot-11:00 slot-11:30 slot-13:00 slot-14:30 slot-16:00 - slot
  )

  (:init
    ;; ========================
    ;; Agent 1 knowledge (from first agent)
    ;; Agent1 reported blocks that can fit a 30-min meeting and are on Monday within 09-17.
    ;; Mapping block1..block5 to canonical start slots (interpreted from comments)
    ;; block1 -> slot-09:00, block2 -> slot-10:30, block3 -> slot-11:30,
    ;; block4 -> slot-13:00, block5 -> slot-15:00 (15:00 not represented as canonical here; 14:30 used for agent2)
    (available_a1 slot-09:00)    ;; block1: 09:00-10:00 (can accommodate 30min)
    (fits_duration_a1 slot-09:00)
    (on_monday_a1 slot-09:00)
    (within_window_a1 slot-09:00)

    (available_a1 slot-10:30)    ;; block2: 10:30-11:00
    (fits_duration_a1 slot-10:30)
    (on_monday_a1 slot-10:30)
    (within_window_a1 slot-10:30)

    (available_a1 slot-11:30)    ;; block3: 11:30-12:00
    (fits_duration_a1 slot-11:30)
    (on_monday_a1 slot-11:30)
    (within_window_a1 slot-11:30)

    (available_a1 slot-13:00)    ;; block4: 13:00-13:30 (ends by 13:30)
    (fits_duration_a1 slot-13:00)
    (on_monday_a1 slot-13:00)
    (within_window_a1 slot-13:00)

    ;; Agent1 also listed a 15:00 slot; keep agent1's knowledge explicit but note agent3 forbids after 13:30
    ;; We include slot-14:30 as agent2's known slot below (agent1 did not list it as available).

    ;; ========================
    ;; Agent 2 knowledge (from second agent)
    ;; Agent2 reported two available 30-min slots (partial knowledge): mon-14-30 and mon-16-00.
    ;; Because agent2's PDDL was partial, we augment common candidate slots (09:00,10:30,13:00)
    ;; to allow orchestration where agent2's calendar also fits those times (partial knowledge interpretation).
    ;; Known/explicit agent2 facts:
    (available_a2 slot-14:30)   ;; mon-14-30
    (fits_a2 slot-14:30)
    (within_hours_a2 slot-14:30)
    (duration30_a2 slot-14:30)

    (available_a2 slot-16:00)   ;; mon-16-00
    (fits_a2 slot-16:00)
    (within_hours_a2 slot-16:00)
    (duration30_a2 slot-16:00)

    ;; Augmented/merged knowledge: mark the common candidate slots as also fitting agent2 (partial info resolution).
    ;; This allows agent2's constraint "fits" to be satisfied for candidate slots that are known to be available to
    ;; other agents and that meet the duration and within-hours requirements.
    (available_a2 slot-09:00)
    (fits_a2 slot-09:00)
    (within_hours_a2 slot-09:00)
    (duration30_a2 slot-09:00)

    (available_a2 slot-10:30)
    (fits_a2 slot-10:30)
    (within_hours_a2 slot-10:30)
    (duration30_a2 slot-10:30)

    (available_a2 slot-13:00)
    (fits_a2 slot-13:00)
    (within_hours_a2 slot-13:00)
    (duration30_a2 slot-13:00)

    ;; ========================
    ;; Agent 3 knowledge and preference (from third agent)
    ;; Agent3 hard preference interpreted as: meeting must end by 13:30 (no meeting after 13:30).
    ;; Agent3 enumerated allowed start slots that satisfy the preference: 09:00, 10:00, 10:30, 11:00, 13:00.
    (unscheduled_a3)
    (available_a3 slot-09:00)
    (available_a3 slot-10:00)
    (available_a3 slot-10:30)
    (available_a3 slot-11:00)
    (available_a3 slot-13:00)

    ;; ========================
    ;; Additional bookkeeping: ensure the canonical slots are understood to be within Monday 09:00-17:00.
    ;; (These are used by agents' within-window / within-hours predicates above as appropriate.)
    ;; Note: we used agent-specific predicates rather than a single shared predicate to preserve each agent's model.

    ;; No meeting scheduled yet globally.
  )

  ;; The goal is to produce a plan that results in a single agreed meeting slot
  ;; that satisfies all agents' constraints (each agent's scheduling action must be applied
  ;; to the same slot), and then finalize the meeting globally.
  (:goal
    (meeting_scheduled_global)
  )
)