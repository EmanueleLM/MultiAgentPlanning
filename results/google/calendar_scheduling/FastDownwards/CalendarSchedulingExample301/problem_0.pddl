(define (problem schedule-monday-0900-1700)
  (:domain schedule-meeting)
  (:objects
    ;; meeting
    meeting1 - meeting

    ;; slots: 30-minute granularity from 09:00 to 17:00 (last slot starts at 16:30)
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot

    ;; Replace these placeholder participants with the actual participant names you provide.
    ;; Example: alice bob carol - participant
    PARTICIPANT_PLACEHOLDER_1 PARTICIPANT_PLACEHOLDER_2 - participant
  )

  ;; Initial facts: declare slots and participants
  (:init
    ;; mark slots
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; mark participants (replace placeholders with actual names)
    (participant PARTICIPANT_PLACEHOLDER_1)
    (participant PARTICIPANT_PLACEHOLDER_2)

    ;; AVAILABILITY FACTS:
    ;; Replace or augment the lines below with concrete (available <participant> <slot>) facts
    ;; based on the availability you provide. Do NOT invent facts beyond your supplied data.
    ;; Example:
    ;; (available alice slot-0900)
    ;; (available alice slot-1000)
    ;; (available bob slot-0900)
    ;;
    ;; Placeholder availability (must be replaced):
    ;; (available PARTICIPANT_PLACEHOLDER_1 slot-0900)
    ;; (available PARTICIPANT_PLACEHOLDER_1 slot-0930)
    ;; (available PARTICIPANT_PLACEHOLDER_2 slot-0900)
    ;; (available PARTICIPANT_PLACEHOLDER_2 slot-1000)
  )

  ;; Goal: meeting1 scheduled (the schedule-meeting-at action will ensure everyone attends).
  (:goal
    (and
      (meeting-scheduled meeting1)
    )
  )

  ;; Optional: we can ask the planner to prefer the earliest slot by post-processing planner outputs.
  ;; If you want the domain/problem to enforce earliest-first rather than post-selecting, provide
  ;; explicit participant availability and I will generate distinct schedule actions per slot in order
  ;; (slot-0900 first) so the planner can choose the earliest satisfying action.
)