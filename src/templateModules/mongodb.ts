import { pick } from 'lodash-es';

import { TemplateType } from '@/core/TemplateType';

export default {
  getTerraformVariables() {
    const variableNames = [
      'project',
      'name',
      'environment',
      'vpcId',
      'vpcBlock',
      'ec2InstanceType',
      'storage',
    ];

    return {
      ...pick(this.config, variableNames),
      sshPublicKeyPath: this.sourceFolder.resolve(this.config.sshPublicKeyPath),
    };
  },
} satisfies TemplateType;
