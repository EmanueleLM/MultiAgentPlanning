PDDL files and ensure they are compatible with Fast Downward.

<domain>
(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    ;; available: participant is available in a given discrete 30-minute slot
    (available ?p - participant ?s - slot)
    ;; earliest-allowed: marks the earliest common slot chosen (set in the problem)
    (earliest-allowed ?s - slot)
    ;; scheduled: the slot that gets scheduled (effect)
    (scheduled ?s - slot)
    ;; meeting-scheduled: global flag indicating meeting scheduled
    (meeting-scheduled)
  )

  ;; Schedule action: can be applied to a slot only if:
  ;;  - that slot is marked earliest-allowed in the problem (so we enforce earliest)
  ;;  - all participants are available in that slot (universal precondition)
  ;;  - a meeting has not already been scheduled
  (:action schedule-slot
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (earliest-allowed ?s)
      (not (meeting-scheduled))
      ;; universal precondition: every participant must be available in the slot
      (forall (?p - participant)
        (available ?p ?s)
      )
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)
</domain>

<problem>
(define (problem schedule-single-30min)
  (:domain meeting-scheduling)

  ;; Objects: participants and the 16 half-hour slots from 09:00 to 17:00 (inclusive of the last slot 16:30-17:00)
  (:objects
    lisa dorothy anthony ryan - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; Declare participants and slots
    (participant lisa)
    (participant dorothy)
    (participant anthony)
    (participant ryan)

    (slot s1)   ;; 09:00-09:30
    (slot s2)   ;; 09:30-10:00
    (slot s3)   ;; 10:00-10:30
    (slot s4)   ;; 10:30-11:00
    (slot s5)   ;; 11:00-11:30
    (slot s6)   ;; 11:30-12:00
    (slot s7)   ;; 12:00-12:30
    (slot s8)   ;; 12:30-13:00
    (slot s9)   ;; 13:00-13:30
    (slot s10)  ;; 13:30-14:00
    (slot s11)  ;; 14:00-14:30
    (slot s12)  ;; 14:30-15:00
    (slot s13)  ;; 15:00-15:30
    (slot s14)  ;; 15:30-16:00
    (slot s15)  ;; 16:00-16:30
    (slot s16)  ;; 16:30-17:00

    ;; NOTE: Availability facts (available <participant> <slot>) must be provided here
    ;; using the exact free intervals from each participant's report. Do NOT invent or assume availability.
    ;; Example of how availability facts will look once you supply data:
    ;;   (available lisa s1)
    ;;   (available lisa s2)
    ;;   (available dorothy s2)
    ;;   ...
    ;;
    ;; After I receive the four availability reports, I will:
    ;;  1) convert each participant's free intervals into the corresponding slot-level (s1..s16) available facts,
    ;;  2) compute the intersection of these availabilities,
    ;;  3) pick the earliest slot in that intersection,
    ;;  4) add (earliest-allowed <that-slot>) here,
    ;;  5) and return the fully populated problem file.
    ;
    ;; The domain requires earliest-allowed for scheduling, so the produced problem will strictly
    ;; enforce the earliest common 30-minute slot.
  )

  ;; Goal: meeting must be scheduled (i.e., one slot becomes scheduled)
  (:goal (meeting-scheduled))
)