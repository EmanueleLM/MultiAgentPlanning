(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: participants and all possible 30-minute start times within 09:00-17:00.
  ;; Start times are represented as symbolic time objects t_09_00, t_09_30, ..., t_16_30.
  (:objects
    donald zachary kathryn deborah teresa james - person

    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30
    t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 t_16_30 - time
  )

  (:init
    ;; declare which symbols are slots and which are persons
    (person donald) (person zachary) (person kathryn) (person deborah) (person teresa) (person james)

    (slot t_09_00) (slot t_09_30) (slot t_10_00) (slot t_10_30) (slot t_11_00) (slot t_11_30)
    (slot t_12_00) (slot t_12_30) (slot t_13_00) (slot t_13_30) (slot t_14_00) (slot t_14_30)
    (slot t_15_00) (slot t_15_30) (slot t_16_00) (slot t_16_30)

    ;; AVAILABILITY FACTS:
    ;; The solver needs concrete (available <person> <time>) facts for each participant and slot.
    ;; Below are placeholders; do NOT invent or change participants or slot symbols,
    ;; but you MUST fill in each participant's real available start times for Monday.
    ;;
    ;; Example (commented) format for a single availability fact:
    ;;   (available donald t_09_00)
    ;;
    ;; Replace or add lines below (remove leading ';') to reflect the actual availability lists
    ;; provided by each participant:
    ;
    ; ;; availability_donald:
    ; (available donald t_09_00)
    ; (available donald t_09_30)
    ;
    ; ;; availability_zachary:
    ; (available zachary t_09_30)
    ; ...
    ;
    ; ;; availability_kathryn:
    ; ;; availability_deborah:
    ; ;; availability_teresa:
    ; ;; availability_james:
    ;
    ; Note: Times must be one of the time objects in the :objects list above.
    ;
    ; IMPORTANT: Do not include availability facts for any slot outside 09:00-16:30.
    ; The meeting must be a single 30-minute start time between 09:00 and 16:30 inclusive.

    ;; No meeting is scheduled initially (meeting-scheduled is absent).
  )

  ;; Goal: one meeting scheduled that satisfies the action preconditions (i.e., all participants present)
  (:goal (meeting-scheduled))

  ;; Notes on enforcing "earliest feasible" behavior:
  ;; - This PDDL domain/problem enforces that all named participants must be available at the chosen time.
  ;; - FastDownward (classical planner) will return a valid schedule (a single schedule action) if one exists.
  ;; - To strictly force selection of the earliest time among all feasible times, we can:
  ;;    a) compute, outside of PDDL, which time is the earliest time where all participants have (available ...) facts,
  ;;    b) then include only that time's (available ...) facts in the initial state (or add a constraint to forbid later times).
  ;;   Alternatively, if you provide the concrete availability lists now, I can:
  ;;    - produce a fully-grounded problem that either (i) only permits scheduling at the earliest common slot
  ;;      by blocking later slots when an earlier common slot exists, or (ii) encode numeric ranks and use a metric
  ;;      to minimize the scheduled time index for an optimal FastDownward configuration.
  ;;
  ;; To proceed to a runnable problem now, please provide the concrete availability lists for:
  ;;   availability_donald, availability_zachary, availability_kathryn,
  ;;   availability_deborah, availability_teresa, availability_james
  ;; in terms of 30-minute start times (HH:MM) that map to the time objects above.
)