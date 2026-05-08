(define (problem manipulator-problem)
  (:domain manipulator-domain)

  (:objects
    manip insp aud - agent
    p1 p2 - part
    src assembly inspection stor - loc
  )

  (:init
    ; agent roles and initial agent locations
    (manipulator manip)
    (inspector insp)
    (auditor aud)
    (at manip src)
    (at insp inspection)
    (at aud stor)

    ; manipulator starts empty-handed
    (handempty manip)

    ; parts initial locations (both at source)
    (at-part p1 src)
    (at-part p2 src)

    ; station classification
    (source src)
    (assembly-station assembly)
    (inspection-station inspection)
    (storage stor)
  )

  ; Goal: every part must be assembled, inspected, audited, and reside in storage.
  (:goal (and
    (at-part p1 stor) (assembled p1) (inspected p1) (audited p1)
    (at-part p2 stor) (assembled p2) (inspected p2) (audited p2)
  ))
)