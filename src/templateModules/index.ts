import amplify from '@/templateModules/amplify';
import dynamodb from '@/templateModules/dynamodb';
import ebs from '@/templateModules/ebs';
import ecs from '@/templateModules/ecs';
import efs from '@/templateModules/efs';
import lambda from '@/templateModules/lambda';
import mongodb from '@/templateModules/mongodb';
import parameters from '@/templateModules/parameters';
import rds from '@/templateModules/rds';
import s3 from '@/templateModules/s3';
import sfn from '@/templateModules/sfn';
import sfnLauncher from '@/templateModules/sfn-launcher';
import sqs from '@/templateModules/sqs';

export const templateModules = {
  amplify,
  dynamodb,
  ebs,
  ecs,
  efs,
  lambda,
  mongodb,
  parameters,
  rds,
  s3,
  sfn,
  'sfn-launcher': sfnLauncher,
  sqs,
};
