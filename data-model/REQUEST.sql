CREATE TABLE [REQUEST] (
  [floor_number] int NOT NULL,
  [person_id] int NOT NULL,
  [timestamp] timestamp NOT NULL
)
GO

ALTER TABLE [REQUEST] ADD FOREIGN KEY ([floor_number]) REFERENCES [FLOOR] ([number])
GO

ALTER TABLE [REQUEST] ADD FOREIGN KEY ([person_id]) REFERENCES [PERSON] ([id])
GO