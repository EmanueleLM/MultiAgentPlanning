(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  ;; Objects: times are 30-minute start times from 09:00 to 16:30 inclusive.
  (:objects
    ;; times (use these exact names in availability facts)
    09_00 09_30 10_00 10_30 11_00 11_30 12_00 12_30 13_00 13_30 14_00 14_30 15_00 15_30 16_00 16_30 - time

    ;; participants
    donald zachary kathryn deborah teresa james - participant
  )

  (:init
    ;; mark worktime (valid meeting start times between 09:00 and 16:30)
    (worktime 09_00) (worktime 09_30) (worktime 10_00) (worktime 10_30)
    (worktime 11_00) (worktime 11_30) (worktime 12_00) (worktime 12_30)
    (worktime 13_00) (worktime 13_30) (worktime 14_00) (worktime 14_30)
    (worktime 15_00) (worktime 15_30) (worktime 16_00) (worktime 16_30)

    ;; ---------- AVAILABILITY FACTS ----------
    ;; Replace the following placeholder comments with concrete availability facts,
    ;; one (available <participant> <time>) line for each start time the participant
    ;; is actually available. Do not invent times — use the real availability lists.
    ;;
    ;; Example (do not leave the example lines if they don't reflect real data):
    ;; (available donald 09_00)
    ;; (available donald 09_30)
    ;;
    ;; Insert availability for each participant here. For instance:
    ;; ---- availability_donald facts ----
    ;; (available donald 09_00)
    ;; (available donald 09_30)
    ;; ...
    ;; ---- availability_zachary facts ----
    ;; (available zachary 09_00)
    ;; ...
    ;; And so on for kathryn, deborah, teresa, james.
    ;;
    ;; IMPORTANT: To make the solver select the earliest feasible time automatically,
    ;; ensure you include the true availability sets. The solver will pick any time
    ;; for which every participant has an (available ...) fact; if multiple such times
    ;; exist, the solver may return any one of them. If you require the solver to
    ;; pick the earliest common time deterministically, reply with the exact availability
    ;; lists and I will produce a problem instance that guarantees earliest selection.
    ;; -------------------------------------

    ;;; Placeholder area — REPLACE with real availability facts:
    ;;; availability_donald:
    ;;; (available donald 09_00)
    ;;; (available donald 09_30)
    ;;; ...
    ;;; availability_zachary:
    ;;; (available zachary 09_30)
    ;;; ...
    ;;; availability_kathryn:
    ;;; ...
    ;;; availability_deborah:
    ;;; ...
    ;;; availability_teresa:
    ;;; ...
    ;;; availability_james:
    ;;; ...
  )

  ;; Goal: a meeting has been scheduled and every participant is attending.
  ;; Because the action sets scheduled-at ?t and attending for every participant
  ;; only when all participants are available at that chosen time, this enforces
  ;; the "All listed participants must be present" constraint.
  (:goal
    (and
      (meeting-scheduled)
      (attending donald) (attending zachary) (attending kathryn)
      (attending deborah) (attending teresa) (attending james)
    )
  )

  ;; No metric is provided here. If you want to find the earliest time automatically,
  ;; provide the exact availability lists and I will (a) encode additional constraints
  ;; to force the earliest selection, or (b) compute the earliest intersection and
  ;; return a problem where only that earliest intersection is allowed by facts.
)