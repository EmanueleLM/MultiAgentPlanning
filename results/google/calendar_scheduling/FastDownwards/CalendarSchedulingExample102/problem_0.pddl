;; Problem template for scheduling a 60-minute meeting (two consecutive 30-minute slots)
;; between 09:00 and 17:00 on Monday for participants: Dylan, Kathryn, Hannah, Anna.
;; IMPORTANT: This is a template. You must supply the participants' busy slots below
;; as hard constraints in the initial state using facts of the form:
;;   (busy Dylan s_09_00)    ; Dylan is busy in the 09:00-09:30 slot
;; Convert each busy interval (e.g., 09:15-10:00) into the corresponding 30-minute slots
;; (e.g., s_09_00, s_09_30) and list (busy <person> <slot>) for each occupied slot.
;; Do not invent availability beyond the provided busy facts.

(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    Dylan Kathryn Hannah Anna - person

    ; 30-minute slots from 09:00-09:30 up to 16:30-17:00
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    ; type facts
    (person Dylan) (person Kathryn) (person Hannah) (person Anna)

    (slot s_09_00) (slot s_09_30) (slot s_10_00) (slot s_10_30)
    (slot s_11_00) (slot s_11_30) (slot s_12_00) (slot s_12_30)
    (slot s_13_00) (slot s_13_30) (slot s_14_00) (slot s_14_30)
    (slot s_15_00) (slot s_15_30) (slot s_16_00) (slot s_16_30)

    ; adjacency for consecutive 30-minute slots
    (next s_09_00 s_09_30)
    (next s_09_30 s_10_00)
    (next s_10_00 s_10_30)
    (next s_10_30 s_11_00)
    (next s_11_00 s_11_30)
    (next s_11_30 s_12_00)
    (next s_12_00 s_12_30)
    (next s_12_30 s_13_00)
    (next s_13_00 s_13_30)
    (next s_13_30 s_14_00)
    (next s_14_00 s_14_30)
    (next s_14_30 s_15_00)
    (next s_15_00 s_15_30)
    (next s_15_30 s_16_00)
    (next s_16_00 s_16_30)

    ; -------------------------
    ; INSERT BUSY FACTS BELOW:
    ; For each participant, list (busy <Person> <Slot>) for every 30-minute slot
    ; that falls inside a busy interval they provided.
    ; Examples:
    ;   (busy Dylan s_09_00)  ; Dylan is busy 09:00-09:30
    ;   (busy Kathryn s_13_30) (busy Kathryn s_14_00) ; Kathryn busy 13:30-14:30
    ;
    ; Replace the example lines below with the actual busy-slot facts you received.
    ; -------------------------

    ;; Example placeholders (REMOVE or REPLACE with the real busy-slot facts):
    ;; (busy Dylan s_10_00) (busy Dylan s_10_30)
    ;; (busy Kathryn s_09_30)
    ;; (busy Hannah s_13_00) (busy Hannah s_13_30)
    ;; (busy Anna s_15_00) (busy Anna s_15_30)

    ; -------------------------
    ; End of busy facts insertion zone.
    ; -------------------------
  )

  (:goal (meeting-scheduled))

  ; Note: This classical planning formulation requests any valid plan that schedules
  ; the meeting (i.e., applies the schedule-meeting action for a start slot).
  ; To prioritise the earliest feasible start time you supply via busy facts,
  ; run this problem through a planner that supports optimality / plan quality
  ; and provide an objective (not included here). If you want, supply the busy
  ; intervals now and I will emit a fully grounded problem that enforces the
  ; earliest feasible start as a hard constraint (by allowing only the earliest
  ; start action that meets availability).
)