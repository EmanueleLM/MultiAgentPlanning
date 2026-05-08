; Problem: assemble two-part widget, inspect, and audit-clear
(define (problem assemble-inspect-audit-prob)
  (:domain manipulator-inspector-auditor)

  (:objects
    manipulator inspector auditor - agent
    home storage1 storage2 station - location
    partA partB - part
  )

  (:init
    ; Initial agent locations
    (at manipulator home)
    (at inspector home)
    (at auditor home)

    ; Initial part locations
    (at-part partA storage1)
    (at-part partB storage2)

    ; Mark the assembly location
    (assembly-station station)

    ; No attachments, no screw, no inspection, no audit initially
    ; (attached partA) and (attached partB) are false by omission
    ; (screwed), (inspected), (audited) are false by omission
  )

  ; Goal: both parts attached, screw fastened, inspection done, and audit cleared.
  (:goal (and
    (attached partA)
    (attached partB)
    (screwed)
    (inspected)
    (audited)
  ))
)