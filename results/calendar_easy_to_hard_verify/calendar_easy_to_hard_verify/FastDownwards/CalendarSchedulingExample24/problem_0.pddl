(define (problem schedule-one-meeting)
  (:domain meeting-scheduling)

  ;; OBJECT DECLARATIONS
  (:objects
    ; Agents: REPLACE the following placeholder agents with the actual participant names.
    ; Example: alice bob carol
    ; If you have N participants, list them here as agent constants.
    ; Note: Do not invent participants; use only the participants you provide.
    ; Agents:
    ;   <REPLACE_WITH_AGENT_LIST>
    ; Example placeholder (remove or replace):
    ;   ; alice bob carol
    ; (Uncomment and replace the above with real agent names, e.g. alice bob)
  )

  ;; Slots: discrete 30-minute slots from 09:00 to 17:00 (16 slots).
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  ;; INITIAL STATE
  (:init
    ; Populate (free <agent> <slot>) facts according to each participant's availability summary.
    ; For each agent and for each slot where they are free, include:
    ;   (free <agent> <slot>)
    ;
    ; RULES for filling availability:
    ; - Treat natural-language preferences such as "avoid", "would rather", "earliest"
    ;   as hard constraints: do not mark a slot free if the participant said they cannot
    ;   or prefer to avoid it.
    ; - Do not invent availability beyond the provided summaries.
    ;
    ; EXAMPLE (do not include unless this matches provided data):
    ;   (free alice s0900)
    ;   (free alice s0930)
    ;   (free bob s0930)
    ;   (free carol s0930)
    ;
    ; After inserting all (free ...) facts according to the actual inputs, you can
    ; choose the goal slot (see below). The planner will need all required (free ...)
    ; facts so that attend actions can be applied for each agent at the chosen slot.
  )

  ;; GOAL
  ;; The goal must state the chosen slot explicitly as the meeting time.
  ;; Replace <CHOSEN_SLOT> with the earliest slot that is free for all participants
  ;; (determined from the availability facts you provided above).
  (:goal
    ; Example:
    ;   (meeting-scheduled s0930)
    ; Replace the following placeholder with the actual chosen slot:
    ;   <REPLACE_WITH_GOAL>
    ; Note: Do not leave this abstract when running the planner — set the goal
    ; to the specific slot you want the planner to produce as the final selected time.
    (and )
  )
)